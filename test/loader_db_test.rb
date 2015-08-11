require_relative 'test_helper'
require_relative '../lib/loader_db'
require_relative '../lib/sales_engine'

class LoaderDBTest < Minitest::Test
  def setup
    @se = SalesEngine.new
    @locations = @se.locations
    @se.startup
  end

  def test_it_creates_a_customer_repository
    expected = [1, "Joey", "Ondricka", "2012-03-27 14:54:09 UTC", "2012-03-27 14:54:09 UTC"]
    actual = @se.db.query("SELECT * FROM CustomerRepository WHERE id = 1")
  end

  # def test_it_creates_a_merchant_repository

  # end

end