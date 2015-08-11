require 'csv'
require_relative 'repository'
require_relative "customer"

class CustomerRepository < Repository
  def my_type
    Customer
  end

  def find_by_id(id)
    find_by(:id, id)
  end

  def invoices_for_customer(customer_id)
    engine.invoices_for_customer(customer_id)
  end

  def find_by_first_name(name)
    find_by(first_name: name)
  end

  def find_all_by_first_name(name)
    find_all_by(first_name: name)
  end

  def find_by_last_name(name)
    find_by(last_name: name)
  end

  def find_all_by_last_name(name)
    find_all_by(last_name: name)
  end
end
