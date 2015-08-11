class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :repository

  def initialize(attributes, repository)
    @id                             = attributes[:id]
    @invoice_id                     = attributes[:invoice_id]
    @credit_card_number             = attributes[:credit_card_number]
    @credit_card_expiration_date    = attributes[:credit_card_expiration_date]
    @result                         = attributes[:result]
    @created_at                     = attributes[:created_at]
    @updated_at                     = attributes[:updated_at]
    @repository                     = repository
  end

  def invoice
    repository.invoice_for_transaction(invoice_id)
  end

end
