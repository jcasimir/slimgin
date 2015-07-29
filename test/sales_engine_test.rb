require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  def test_it_loads_customer_repostiory
    engine = SalesEngine.new

    engine.startup

    assert_kind_of CustomerRepository, engine.customer_repository
  end

  def test_it_loads_invoice_repository
    engine = SalesEngine.new

    engine.startup

    assert_kind_of InvoiceRepository, engine.invoice_repository
  end

  def test_it_can_get_invoice_from_invoice_repo
    engine = SalesEngine.new
    engine.startup

    assert_kind_of Invoice, engine.invoice_repository.id("1")
  end

  def test_it_can_get_customer_from_customer_repo
    engine = SalesEngine.new
    engine.startup

    assert_kind_of Customer, engine.customer_repository.id("1")
  end

  def test_repo_knows_what_engine_it_belongs_to
    engine = SalesEngine.new
    engine.startup

    assert_equal engine, engine.customer_repository.engine
  end
end
