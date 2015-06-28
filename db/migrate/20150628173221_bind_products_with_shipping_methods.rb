class BindProductsWithShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_products, :shipping_method_id, :integer
    add_index :spree_products, :shipping_method_id
  end
end
