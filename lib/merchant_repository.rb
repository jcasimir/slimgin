class MerchantRepository < Repository
  def my_type repository, attributes
    Merchant.new repository, attributes
  end
end
