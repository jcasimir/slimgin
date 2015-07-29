require 'csv'
require_relative 'repository'

class CustomerRepository < Repository
  def my_type repository, attributes
    Customer.new repository, attributes
  end
end
