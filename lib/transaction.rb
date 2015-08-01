require_relative "data_instance"

class Transaction < DataInstance
  attr_reader :invoice_id, :credit_card_number, :credit_card_expiration_date,
              :result

  
end
