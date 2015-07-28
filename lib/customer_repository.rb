class CustomerRepository
  attr_accessor :filename

  def initialize filename
    @filename = File.new(filename)
  end
end
