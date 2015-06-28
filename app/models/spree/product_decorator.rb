Spree::Product.class_eval do
  validates :shipping_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
