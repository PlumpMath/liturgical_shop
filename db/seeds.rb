# core stuff like countries, roles etc
ActiveRecord::Base.logger = nil

gemspec = Gem.loaded_specs['spree_core']
seed_dir = File.join(gemspec.gem_dir, 'db', 'default', 'spree')
%w( countries roles states stores).each do |file|
  load File.join(seed_dir, file + '.rb')
end
country_poland = Spree::Country.where(iso: "PL").first
Spree::Config[:currency] = 'PLN'
Spree::Config[:track_inventory_levels] = true
Spree::Config[:allow_guest_checkout] = false
Spree::Config[:default_country_id] = country_poland.id

# zones
zone_pln = Spree::Zone.find_or_create_by!(name: 'PLN', kind: 'country') do |zone|
  zone.countries = [country_poland]
end

# categories and taxonomies
categories = Spree::Taxonomy.find_or_create_by!(name: 'Kategorie')
Spree::Taxon.create!(name: 'Świece olejowe', taxonomy: categories)
Spree::Taxon.create!(name: 'Paschały', taxonomy: categories)

# admin user
admin_role = Spree::Role.find_or_create_by!(name: 'admin')
admin_user = Spree::User.create!(
  email: 'spree@example.com',
  password: 'spree123',
  password_confirmation: 'spree123',
  login: 'admin'
)
admin_user.spree_roles << admin_role
admin_user.save!
admin_user.generate_spree_api_key!

# tax category
tax_rate = 23
tax = Spree::TaxCategory.find_or_create_by!(name: "VAT #{tax_rate}%", tax_code: tax_rate, is_default: true)
# amount     = BigDecimal.new(tax_code)/100
tax.tax_rates.create!(
  name:               tax.name,
  included_in_price:  true,
  amount:             BigDecimal.new(tax_rate)/100,
  calculator:         Spree::Calculator::DefaultTax.new,
  show_rate_in_label: false
)

# stock location
Spree::StockLocation.find_or_create_by!(
  name: 'default',
  default: true,
  country: country_poland,
  active: true,
  backorderable_default: true
)

# shippings
shipping_category = Spree::ShippingCategory.where(name: 'Default').first_or_create!
shipping_method = Spree::ShippingMethod.create!(
    name: 'Kurier',
    zones: [zone_pln],
    tax_category: tax,
    calculator: MostExpensiveShippingCalculator.create!,
    shipping_categories: [shipping_category],
    display_on: :both
)

# payment methods
payment_cod = Spree::PaymentMethod::Check.create!(name: 'Płatność przy odbiorze', active: true, display_on: :both)

