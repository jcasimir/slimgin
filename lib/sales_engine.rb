require_relative "invoice_item_repository"

class SalesEngine
  attr_accessor :locations, :merchant_repository, :invoice_repository,
                :item_repository, :invoice_item_repository, :customer_repository,
                :transaction_repository
  def startup
    @locations = {
      customer_repository: "./test/fixtures/customers.csv",
      invoice_repository: "./test/fixtures/invoices.csv",
      merchant_repository: "./test/fixtures/merchants.csv",
      item_repository: "./test/fixtures/items.csv",
      transaction_repository: "./test/fixtures/transactions.csv",
      invoice_item_repository: "./test/fixtures/invoice_items.csv",
    }
    @customer_repository     = CustomerRepository.new self, locations[:customer_repository]
    @invoice_repository      = InvoiceRepository.new self, locations[:invoice_repository]
    @merchant_repository     = MerchantRepository.new self, locations[:merchant_repository]
    @item_repository         = ItemRepository.new self, locations[:item_repository]
    @transaction_repository  = TransactionRepository.new self, locations[:transaction_repository]
    @invoice_item_repository = InvoiceItemRepository.new self, locations[:invoice_item_repository]
  end


  # relationships

  def invoices_for_a_merchant(merchant_id)
    invoice_repository.find_all_by(merchant_id: merchant_id)
  end

  def items_for_a_merchant(merchant_id)
    item_repository.find_all_by(merchant_id: merchant_id)
  end

  def merchant_for_an_invoice(merchant_id)
    merchant_repository.database[merchant_id]
  end

  def transactions_for_an_invoice(invoice_id)
    transaction_repository.find_all_by(invoice_id: invoice_id)
  end

  def invoice_items_for_an_invoice(invoice_id)
    invoice_item_repository.find_all_by(invoice_id: invoice_id)
  end

  def items_for_an_invoice(invoice_id)
    invoice_items = invoice_items_for_an_invoice(invoice_id)
    items = []
    invoice_items.each do |invoice_item_id, invoice_item|
      items << item_repository.find_all_by(id: invoice_item.item_id)
    end
  end

  def invoice_for_invoice_item(invoice_id)
    invoice_repository.find_by(id: invoice_id)
  end



end
