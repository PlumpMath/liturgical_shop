Deface::Override.new(virtual_path:  "spree/admin/products/_form",
                     insert_after:  "[data-hook='admin_product_form_shipping_categories']",
                     partial:       'overrides/shipping_method_select_for_edit',
                     name:          "add_shipping_method_to_edit_product_form")
