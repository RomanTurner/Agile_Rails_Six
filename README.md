## Task E
PlayTime 
[x]- Create a migration that compies the product price into the line item, and change the
add_product() method in the Cart model to capture the price whenever a new line item is created.
* Practice writing up / down methods for reversable migrations. 

[]- Write unit tests that add both unique products and duplicate products to a cart. Assert how many products should be in the cart
each instance. Note that you'll need to modify the fixture to refer to products and carts by name- for example, product: ruby

[x]- Add the ability to delete individual line items from the cart. This will require buttons on each line, and such buttons
will need to be linked to the destroy() action in the LineItemsController
* Using conditinal rendering, if the item had a quantity greater than one I would send #edit/line_item to decrease the item
quantity by 1. If quantity == 1, I send #destroy/line_item 

[x]- We prevented accessing the other users' carts in the LineItemsController, but you can still see other carts by
navigating directly to a URL. See if you can prevent accessing any cart other than the one stored in the session. 

* In #show/cart I added a conditional to compare the instance to the session[:cart_id]
