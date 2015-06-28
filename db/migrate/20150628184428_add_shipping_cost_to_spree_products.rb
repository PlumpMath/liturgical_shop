class AddShippingCostToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :shipping_cost, :decimal, precision: 10, scale: 2, null: false, default: 0
  end
end
