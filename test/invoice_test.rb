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
end
