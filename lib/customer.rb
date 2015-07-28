class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize id, first_name, last_name, created_at, updated_at
    @id = id.to_i
    @first_name = first_name
    @last_name = last_name
    @created_at = Time.parse(created_at)
    @updated_at = Time.parse(updated_at)
  end
end
