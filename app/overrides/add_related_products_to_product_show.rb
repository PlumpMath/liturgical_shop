Deface::Override.new(virtual_path:  "spree/products/show",
                     insert_after:  "[data-hook='cart_form']",
                     partial:       'overrides/related_products',
                     name:          "add_related_products_to_product_show")
