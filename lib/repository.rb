require "csv"

class Repository
  attr_accessor :engine, :location, :database

  def initialize engine, location
    @engine ||= engine
    @location ||= File.new(location)
    @database ||= load_db
  end

  def all
    database
  end

  def random
    id = database.keys.sample
    database[id]
  end

  def find_by search_attribute
    all = find_all_by(search_attribute)
    all[0]
  end

  def find_all_by search_attribute
    key = search_attribute.keys[0]
    value = search_attribute.values[0]
    out = {}
    database.each do |id, attributes|
      out[id] = attributes if attributes.send(key) == value
    end
    out.values
  end

  def load_db
    db = {}
    CSV.foreach location, :headers => true do |row|
      id = row.fields[0]
      row_as_hash = row.to_hash
      db[id.to_i] = my_type(self, row_as_hash)
    end
    db
  end

  def id (id_number)
    database[id_number]
  end

  def inspect
    "#<#{self.class} #{@database.size} rows>"
  end

end
