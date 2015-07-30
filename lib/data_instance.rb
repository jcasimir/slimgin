class DataInstance
  attr_reader :repository, :referable, :created_at, :updated_at

  def initialize repository, attributes
    @repository = repository
    @referable = Hash.new
    attributes.each do |key, value|
      instance_variable_set("@#{key}", parse(value)) unless key.nil?
    end
  end

  def attributes
    out = {}
    instance_variables.each do |name|
      non_instance_name = name.to_s.delete("@").to_sym
      out[non_instance_name] = instance_variable_get name
    end
    out
  end

  def parse input
    time = Time.parse(input) rescue nil
    input = time if input == time.to_s
    input
  end

  def customer
    customer_repository.id(customer_id)
  end

  def customer_repository
    repository.engine.customer_repository
  end
end
