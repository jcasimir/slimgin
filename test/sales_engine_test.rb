require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineSpec < Minitest::Spec
  @@flag = nil

  before do
    unless @@flag
      @se = SalesEngine.new("./data/fixtures")
      @se.startup
      @@flag = true
    end
  end

  def test_it_creates_a_database_for_itself
    assert_kind_of(SQLite3::Database, @se.db, "db is not a SQLite3 database as expected")
  end


  # ########### PREVIOUS DEVELOPER ##########
  # def test_it_loads_item_repository
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_kind_of ItemRepository, engine.item_repository
  # end

  # def test_it_has_a_list_of_filenames
  #   engine = SalesEngine.new("./test/fixtures")

  #   engine.startup

  #   assert_kind_of Hash, engine.locations
  # end

  # def test_filename_list_contains_filenames
  #   engine = SalesEngine.new("./test/fixtures")

  #   engine.startup

  #   assert_kind_of String, engine.locations[:customer_repository]
  # end

  # def test_it_loads_customer_repostiory
  #   engine = SalesEngine.new("./test/fixtures")

  #   engine.startup

  #   assert_kind_of CustomerRepository, engine.customer_repository
  # end

  # def test_repository_is_loaded_with_filename
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   expected = CustomerRepository.new engine, engine.locations[:customer_repository]
  #   actual = engine.customer_repository
  #   assert_equal expected.location.inspect, actual.location.inspect
  # end

  # def test_repository_knows_location
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_kind_of File, engine.customer_repository.location
  # end

  # def test_it_loads_invoice_repository
  #   engine = SalesEngine.new("./test/fixtures")

  #   engine.startup

  #   assert_kind_of InvoiceRepository, engine.invoice_repository
  # end

  # def test_it_loads_merchant_repository
  #   engine = SalesEngine.new("./test/fixtures")

  #   engine.startup

  #   assert_kind_of MerchantRepository, engine.merchant_repository
  # end

  # def test_it_can_get_invoice_from_invoice_repo
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_kind_of Invoice, engine.invoice_repository.id(1)
  # end

  # def test_it_can_get_customer_from_customer_repo
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_kind_of Customer, engine.customer_repository.id(1)
  # end

  # def test_it_can_get_merchant_from_merchant_repo
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_kind_of Merchant, engine.merchant_repository.id(1)
  # end

  # def test_repo_knows_what_engine_it_belongs_to
  #   engine = SalesEngine.new("./test/fixtures")
  #   engine.startup

  #   assert_equal engine, engine.customer_repository.engine
  # end
end
