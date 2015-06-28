# encoding: utf-8
class MostExpensiveShippingCalculator < Spree::ShippingCalculator
  preference :price, :decimal, default: 0.0

  def self.description
    "Najdroższa wygrywa"
  end

  def compute_package(package)
    binding.pry

    11.0
  end
end
