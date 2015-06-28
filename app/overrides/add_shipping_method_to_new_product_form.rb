Deface::Override.new(virtual_path:  "spree/admin/products/new",
                     insert_after:  "[data-hook='new_product_shipping_category']",
                     partial:       'overrides/shipping_method_select_for_new',
                     name:          "add_shipping_method_to_new_product_form")
