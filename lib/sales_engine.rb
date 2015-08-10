require_relative "customer_repository"
require_relative "invoice_item_repository"
require_relative "item_repository"
require_relative "invoice_repository"
require_relative "merchant_repository"
require_relative "transaction_repository"
require_relative "loader_csv"

class SalesEngine
  FILE_PATH = "../sales_engine/data/"
  attr_reader :locations,
              :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :file_path
  attr_accessor :db

  def initialize(file_path = FILE_PATH)
    @file_path = file_path
    @locations = {
      customer_repository:      "#{file_path}/customers.csv",
      invoice_repository:       "#{file_path}/invoices.csv",
      merchant_repository:      "#{file_path}/merchants.csv",
      item_repository:          "#{file_path}/items.csv",
      transaction_repository:   "#{file_path}/transactions.csv",
      invoice_item_repository:  "#{file_path}/invoice_items.csv"
    }
  end

  def startup
    loaded_csvs = locations.map { |path| LoaderCSV.new(path) }
    self.db = db_loader(loaded_csvs)

    @customer_repository     = CustomerRepository.new(self)
    @merchant_repository     = MerchantRepository.new(self)
    @item_repository         = ItemRepository.new(self)
    @transaction_repository  = TransactionRepository.new(self)
    @invoice_repository      = InvoiceRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
  end

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
    items = invoice_items.map do |invoice_item|
      item_repository.id(invoice_item.item_id)
    end
      items.flatten
  end

  def invoice_for_invoice_item(invoice_id)
    invoice_repository.find_by(id: invoice_id)
  end

  def item_for_invoice_item(item_id)
    item_repository.find_by(id: item_id)
  end

  def invoice_items_for_an_item(item_id)
    invoice_item_repository.find_all_by(item_id: item_id)
  end

  def merchant_for_an_item(merchant_id)
    merchant_repository.find_by(id: merchant_id)
  end

  def invoice_for_transaction(invoice_id)
    invoice_repository.find_by(id: invoice_id)
  end

  def invoices_for_customer(customer_id)
    invoice_repository.find_all_by(customer_id: customer_id)
  end

  def successful_invoices_for_a_merchant(merchant_id, date = '')
    selected_for_a_merch = invoice_repository.select_for_a_merchant(merchant_id)
    invoice_repository.select_for_a_date(date, selected_for_a_merch)
  end

  def revenue_for_a_merchant(merchant_id, date)
    merchant_invoices = invoice_repository
                                      .successful_merchant_invoices[merchant_id]
    total_invoices = merchant_invoices
     unless date == ''
       date_invoices = invoice_repository.successful_date_invoices[date]
       date_invoices = [] if date_invoices == nil
       total_invoices = merchant_invoices & date_invoices
     end
    return 0 if total_invoices.nil?
    revenue = total_invoices.map do |invoice|
        invoice_revenue(invoice.id)
    end
    revenue.flatten.reduce(:+)
  end

  def invoice_revenue(invoice_id)
    invoice_items_for_an_invoice(invoice_id).map do |invoice_item|
      invoice_item.total_price
    end
  end

  def total_items_for_a_merchant(merchant_id)
    invoices = invoice_repository.successful_merchant_invoices[merchant_id]

    return 0 if invoices.nil?
    total = invoices.map do |invoice|
      total_items(invoice.id)
    end
    total.flatten.reduce(:+)
  end

  def total_items(invoice_id)
    invoice_items_for_an_invoice(invoice_id).map do |invoice_item|
      invoice_item.quantity
    end
  end

  def revenue_for_a_date(date)
    invoice_repository.select_for_a_date(date).map do |invoice_id, invoice|
      invoice_revenue(invoice_id)
    end
      .flatten.reduce(:+)
  end

  def transactions_per_customer_id(merchant_id)
    customer_transactions = Hash.new(0)
    invoice_repository.select_for_a_merchant(merchant_id)
                      .each do |invoice_id, invoice|
      customer_transactions[invoice.customer_id] += invoice.transactions.size
    end
    customer_transactions
  end

  def customers_with_pending_invoices_for_a_merchant(merchant_id)
    pending_invoices = invoice_repository.pending_invoices
    invoice_repository.select_for_a_merchant(merchant_id, pending_invoices)
                    .map { |invoice_id, invoice| invoice.customer_id }
                    .map { |customer_id| customer_repository
                    .find_by(id: customer_id) }
  end

  def revenue_of_items
    invoice_item_repository.item_ids_and_total_prices
  end

  def quantity_of_items
    invoice_item_repository.item_ids_and_quantities
  end

  def successful_invoice_items
    invoice_item_repository.successful_invoice_items
  end

  def successful_invoices
    invoice_repository.successful_invoices
  end

  def create_invoice_item(args)
    invoice_item_repository.create_invoice_item(args)
  end

  def create_transaction(args)
    transaction_repository.create(args)
  end

end
