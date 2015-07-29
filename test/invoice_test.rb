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

    assert_equal invoice.customer_id, "1"
  end

  def test_it_has_a_merchant_id
    invoice = Invoice.new nil, {merchant_id: "123"}

    assert_equal invoice.merchant_id, "123"
  end

  def test_it_has_status
    invoice = Invoice.new nil, {status: "shipped"}

    assert_equal invoice.status, "shipped"
  end

  def test_it_has_created_at_date
    invoice = Invoice.new nil, {created_at: "2012-03-25 09:54:09 UTC"}

    assert_equal invoice.created_at.to_s, "2012-03-25 09:54:09 UTC"
  end
end
