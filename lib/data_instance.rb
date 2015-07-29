class DataInstance
  attr_reader :repository

  def initialize repository, hash
    hash.each do |key, value|
      instance_variable_set("@#{key}", parse(value)) unless key.nil?
    end
  end

  def parse input
    time = Time.parse(input) rescue nil
    input = time if input == time.to_s
    input
  end
end
