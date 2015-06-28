Deface::Override.new(virtual_path:  "spree/admin/products/_form",
                     insert_after:  "[data-hook='admin_product_form_shipping_categories']",
                     partial:       'overrides/shipping_cost_input_for_edit',
                     name:          "add_shipping_cost_to_edit_product_form")
