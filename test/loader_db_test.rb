require_relative 'test_helper'
require_relative '../lib/loader_db'
require_relative '../lib/sales_engine'

class LoaderDBTest < Minitest::Test
  def setup
    @se = SalesEngine.new
    @locations = @se.locations
  end
  def test_it_creates_a_database_for_the_engine
    loader = LoaderDB.new(@locations, @se)

    assert_kind_of(SQLite3::Database, loader.db_handle, "db_handle is not a SQLite3 database as expected")
  end
  
end