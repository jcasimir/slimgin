require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  def test_it_is_an_invoice
    invoice = Invoice.new nil, {}

    assert_kind_of Invoice, invoice
  end

  def test_it_is_a_data_instance
    invoice = Invoice.new nil, {}

    assert_kind_of DataInstance, invoice
  end

  def test_it_has_a_customer_id
    invoice = Invoice.new nil, {customer_id: "1"}

    assert_equal "1", invoice.customer_id
  end

  def test_it_has_a_merchant_id
    invoice = Invoice.new nil, {merchant_id: "123"}

    assert_equal "123", invoice.merchant_id
  end

  def test_it_has_status
    invoice = Invoice.new nil, {status: "shipped"}

    assert_equal "shipped", invoice.status
  end

  def test_it_has_created_at_time
    invoice = Invoice.new nil, {created_at: "2012-03-25 09:54:09 UTC"}

    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at.to_s
  end

  def test_created_at_time_is_time_class
    skip
    invoice = Invoice.new nil, {created_at: "1994-04-20 12:35:09 UTC"}

    assert_kind_of Time, invoice.created_at
  end

  def test_it_can_give_a_hash_of_attributes
    invoice = Invoice.new nil, {customer_id: "856", merchant_id: "987", status: "shipped"}

    assert_kind_of Hash, invoice.attributes
  end

  def test_hash_of_attributes_is_correct
    invoice = Invoice.new nil, {customer_id: "231", merchant_id: "0000", status: "in transit"}

    assert_equal invoice.attributes[:customer_id], invoice.customer_id
  end

  def test_belongs_to_an_engine
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_kind_of SalesEngine, invoice.repository.engine
  end

  def test_knows_what_engine_it_belongs_to
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_equal invoice.repository.engine, engine
  end

  def test_it_has_a_customer_repository
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_kind_of CustomerRepository, invoice.customer_repository
  end

  def test_knows_the_customer_repository_of_the_engine_to_which_it_belongs
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_equal invoice.customer_repository, engine.customer_repository
  end

  def test_the_engine_to_which_it_belongs_refers_to_a_customer
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_kind_of Customer, engine.customer_repository.id("1")
  end

  def test_it_refers_to_a_customer
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_kind_of Customer, invoice.customer_repository.id("1")
  end

  def test_it_knows_the_customer_to_which_it_refers
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoice_repository.id("1")

    assert_equal invoice.customer, engine.customer_repository.id(invoice.customer_id)
  end
end
