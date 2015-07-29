require 'csv'

class CustomerRepository
  attr_accessor :filename, :database

  def initialize filename
    @filename = File.new(filename)
    @database = load_db
  end

  def load_db
    db = {}
    CSV.foreach filename, :headers => true do |row|
      id = row.fields[0]
      row_as_hash = row.to_hash.tap{|x| x.delete("id")}
      db[id] = Customer.new(row_as_hash)
    end
    db
  end

  def id id_number
    database[id_number]
  end
end
