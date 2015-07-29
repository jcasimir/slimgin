require_relative 'test_helper'
require_relative '../lib/invoice_repository.rb'

class InvoiceRepositoryTest < Minitest::Test
  def test_it_is_a_repository
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    assert_kind_of Repository, invoice_repo
  end

  def test_it_knows_what_file_it_refers_to
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    assert_kind_of File, invoice_repo.filename
  end

  def test_it_can_fetch_an_invoice
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    assert_kind_of Invoice, invoice_repo.id("1")
  end

  def test_it_can_fetch_using_all
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    assert_kind_of Hash, invoice_repo.all
  end

  def test_it_fetches_invoices_using_all
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    assert_kind_of Invoice, invoice_repo.all.values[0]
  end

  def test_it_fetches_a_random_instance
    # this test has a one in a quadrillion chance of accidentally failing
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    invoices = []
    50.times do
      invoices << invoice_repo.random
    end

    assert_equal 50, invoices.length
    refute_equal 1, invoices.uniq.length
  end

  def test_random_instance_is_id_attributes_pair
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    random = invoice_repo.random

    assert_kind_of Hash, random
    assert random.keys.length == 1
    assert_kind_of String, random.keys[0]
    assert random.values.length == 1
    assert_kind_of Invoice, random.values[0]
  end

  def test_it_can_fetch_by_attribute
    invoice_repo = InvoiceRepository.new "./fixtures/invoices_head.csv"

    invoices = invoice_repo.find_all_by(merchant_id: "1")

    assert_kind_of Hash, invoices
  end
end
