require_relative 'data_instance'

class Customer < DataInstance
  attr_reader :first_name, :last_name
end
