require 'csv'
require_relative 'repository'

class CustomerRepository < Repository
  def my_type repository, attributes
    Customer.new repository, attributes
  end

  def invoices_for_customer(customer_id)
    engine.invoices_for_customer(customer_id)
  end
end
