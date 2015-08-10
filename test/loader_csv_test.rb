require_relative 'test_helper'
require_relative '../lib/loader_csv'
require_relative '../lib/sales_engine'

class LoaderCSVTest < Minitest::Test
  def setup
    @se = SalesEngine.new
    @locations = @se.locations
  end

  def test_it_creates_a_temporary_array_with_items_from_given_csv
    loader = LoaderCSV.new('data/fixtures/customers.csv')
    loader.load
    rows = loader.db.length

    assert_equal rows, 6
  end

  def test_it_creates_another_temporary_array_with_items_from_given_csv
    loader = LoaderCSV.new('data/fixtures/merchants.csv')
    loader.load
    rows = loader.db.length

    assert_equal rows, 28
  end

  def test_it_creates_a_headers_variable_from_csv_header_row
    loader = LoaderCSV.new('data/fixtures/customers.csv')
    loader.load
    headers = loader.headers

    expected = ["id","first_name","last_name","created_at","updated_at"]

    assert_equal expected, headers
  end

  def test_it_creates_different_headers_variable_from_csv_header_row
    loader = LoaderCSV.new('data/fixtures/items.csv')
    loader.load
    headers = loader.headers

    expected = ["id","name","description","unit_price","merchant_id","created_at","updated_at"]

    assert_equal expected, headers
  end

end