Deface::Override.new(virtual_path:  "spree/admin/products/new",
                     insert_after:  "[data-hook='new_product_shipping_category']",
                     partial:       'overrides/shipping_cost_input_for_new',
                     name:          "add_shipping_cost_to_new_product_form")
