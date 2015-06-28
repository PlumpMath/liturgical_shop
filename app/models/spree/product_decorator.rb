Spree::Product.class_eval do
  belongs_to :shipping_method, foreign_key: :shipping_method_id, class_name: 'Spree::ShippingMethod'

  validates :shipping_method, presence: true
end
