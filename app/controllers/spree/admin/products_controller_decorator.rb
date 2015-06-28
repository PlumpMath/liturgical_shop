Spree::Admin::ProductsController.class_eval do
  before_filter :load_shipping_methods, only: [:new, :create, :edit, :update]

  private

  def load_shipping_methods
    @shipping_methods = Spree::ShippingMethod.all
  end
end
