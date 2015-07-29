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
end
