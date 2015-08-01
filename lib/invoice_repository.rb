class InvoiceRepository < Repository
  def my_type repository, attributes
    Invoice.new repository, attributes
  end

  def merchant_for_an_invoice(merchant_id)
    engine.merchant_for_an_invoice(merchant_id)
  end
end
