require "csv"

class Repository
  attr_accessor :engine,
                :location,
                :database,
                :headers

  def initialize(engine)
    @headers = []
    @engine   ||= engine
  end

  def all
    database
  end

  def random
    id = database.keys.sample
    database[id]
  end

  def find_by(search_attribute)
    find_all_by(search_attribute)[0]
  end

  def find_all_by(search_attribute)
    key = search_attribute.keys[0]
    value = search_attribute.values[0]
    out = {}
    database.each do |id, attributes|
      out[id] = attributes if attributes.send(key) == value
    end
    out.values
  end

  def id (id_number)
    database[id_number]
  end

  def inspect
    "#<#{self.class} #{@database.size} rows>"
  end

end
