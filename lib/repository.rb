class Repository
  attr_accessor :filename, :database

  def initialize filename
    @filename = File.new(filename)
    @database = load_db
  end

  def all
    database
  end

  def random
    id = database.keys.sample
    hash = {id => database[id]}
  end

  def find_all_by search_attribute
    key = search_attribute.keys[0]
    value = search_attribute.values[0]
    out = {}
    database.each do |id, attributes|
      out[id] = attributes if attributes.send(key) == value
    end
    out
  end

  def load_db
    db = {}
    CSV.foreach filename, :headers => true do |row|
      id = row.fields[0]
      row_as_hash = row.to_hash.tap{|x| x.delete("id")}
      db[id] = my_type(self, row_as_hash)
    end
    db
  end

  def id id_number
    database[id_number]
  end
end
