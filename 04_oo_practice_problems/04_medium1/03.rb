# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  protected
  attr_writer :quantity
end

my_invoice = InvoiceEntry.new("soap", 5)
my_invoice.update_quantity(10)
p my_invoice
# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, 
# it must be accessed with the @quantity notation when setting it. 
# One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?
# technically no, however we want to make sure we we don't have access to methods outside of the class if not necessary,
# a safer way to code this would be to put a private setter method for quant at the mothed