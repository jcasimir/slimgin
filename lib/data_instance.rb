class DataInstance
  attr_reader :repository, :created_at, :updated_at

  def initialize repository, hash
    hash.each do |key, value|
      instance_variable_set("@#{key}", parse(value)) unless key.nil?
    end
  end

  def attributes
    out = {}
    instance_variables.each do |name|
      out[name] = instance_variable_get name
    end
    out
  end

  def parse input
    time = Time.parse(input) rescue nil
    input = time if input == time.to_s
    input
  end
end
