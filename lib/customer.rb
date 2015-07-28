class Customer
  attr_reader :first_name, :last_name, :created_at, :updated_at

  def initialize first_name, last_name, created_at, updated_at
    @first_name = first_name
    @last_name = last_name
    @created_at = Time.parse(created_at)
    @updated_at = Time.parse(updated_at)
  end
end
