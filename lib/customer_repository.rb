require 'csv'
require_relative 'repository'

class CustomerRepository < Repository
  attr_accessor :filename, :database
end
