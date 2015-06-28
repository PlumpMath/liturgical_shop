class RemoveShippingMethodIdFromSpreeProducts < ActiveRecord::Migration
  def up
    remove_index :spree_products, :shipping_method_id
    remove_column :spree_products, :shipping_method_id
  end

  def down
    add_column :spree_products, :shipping_method_id, :integer
    add_index :spree_products, :shipping_method_id
  end
end
