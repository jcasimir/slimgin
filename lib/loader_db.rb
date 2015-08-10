require 'SQLite3'

class LoaderDB
  attr_reader :db_handle

  def initialize(locations, engine)
    @db_handle = create_db
  end

  def create_db
    SQLite3::Database.new ":memory:"
  end

  def add_tables
    
  end



end