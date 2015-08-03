require_relative 'transaction'
require_relative 'repository'

class TransactionRepository < Repository

  def my_type(repository, attributes)
    Transaction.new(repository, attributes)
  end

  def find_by_id(id)
    id(id)
  end

  def find_by_invoice_id(invoice_id)
    find_by(invoice_id: invoice_id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by(invoice_id: invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)
    find_by(credit_card_number: credit_card_number)
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by(credit_card_number: credit_card_number)
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    find_by(credit_card_expiration_date: credit_card_expiration_date)
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    find_all_by(credit_card_expiration_date: credit_card_expiration_date)
  end

  def find_by_result(result)
    find_by(result: result)
  end

  def find_all_by_result(result)
    find_all_by(result: result)
  end

  def invoice_for_transaction(invoice_id)
    engine.invoice_for_transaction(invoice_id)
  end

end
