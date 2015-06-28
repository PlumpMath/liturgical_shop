# encoding: utf-8
class MostExpensiveShippingCalculator < Spree::ShippingCalculator
  def self.description
    "Najdroższa wygrywa"
  end

  def compute_package(package)
    biggest_shipping_cost_for(package)
  end

  private

  def biggest_shipping_cost_for(package)
    shipping_costs = package.contents.map do |content|
      content.line_item.product.shipping_cost
    end

    shipping_costs.max
  end
end
