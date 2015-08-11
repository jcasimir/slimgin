require_relative 'spec_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/sales_engine'

describe MerchantRepository do
  before :all do
    @engine = SalesEngine.new("./data/fixtures")
    @engine.startup
  end

  it "is a repository" do
    merchant_repo = MerchantRepository.new @engine

    expect(merchant_repo.class).to eq(MerchantRepository)
    expect(merchant_repo.is_a?(Repository)).to be_truthy
  end

  it "can find a merhchant by ID" do
    found = @engine.merchant_repository.find_by_id(1)

    expect(found.class).to eq(Merchant)
    expect(found.id).to eq(1)
  end

  # def test_it_contains_merchants
  #   merchant_repo = MerchantRepository.new nil, "./test/fixtures/merchants.csv"

  #   assert_kind_of Merchant, merchant_repo.id(1)
  # end

  # def test_can_identify_top_X_merchants_by_revenue
  #   repo = engine.merchant_repository

  #   results = repo.most_revenue(2)
  #   expected = ["Schroeder-Jerde", "Klein, Rempel and Jones"]

  #   assert_equal expected, results.map { |merchant| merchant.name }
  # end

  # def test_can_identify_top_X_merchants_by_items
  #   repo = engine.merchant_repository

  #   results = repo.most_items(2)
  #   expected = ["Schroeder-Jerde", "Klein, Rempel and Jones"]

  #   assert_equal expected, results.map { |merchant| merchant.name }
  # end

  # def test_it_can_calculate_the_total_revenue_for_a_given_date
  #   repo = engine.merchant_repository

  #   assert_equal 21067.77, repo.revenue(Date.parse("2012-03-25"))
  # end

end
