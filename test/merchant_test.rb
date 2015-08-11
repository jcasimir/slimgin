# require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'

  describe Merchant do
    before do
      # unless @@flag == true
      @engine = SalesEngine.new("./test/fixtures")
      @engine.startup
      # @@flag = true
    # end
    end

    it "knows what name it has" do
      merchant = Merchant.new nil, name: "Alice"

      assert_equal "Alice", merchant.name

    end

    it "does not go berserk when w00ted up to 5 times" do
      1.upto(5) { @player.w00t }

      expect(@player.berserk?).to eq(false)
    end

    it "gets w00ted instead of blammed when it's gone berserk" do
      1.upto(6) { @player.w00t }
      (1..2).each { @player.blam }

      expect(@player.health).to eq(@initial_health + (8 * 15))
    end
  end

class MerchantSpec < Minitest::Spec
  # attr_reader :engine

  @@flag = nil

  before do
    unless @@flag == true
      @@engine = SalesEngine.new("./test/fixtures")
      @@engine.startup
      @@flag = true
    end
  end

  # after do
  #   @engine.db.close
  #   @engine = nil
  # end

  def test_it_knows_what_name_it_has
    merchant = Merchant.new nil, name: "Alice"

    assert_equal "Alice", merchant.name
  end

  def test_it_can_find_invoices
    repo = engine.merchant_repository
    merchant = repo.id(1)
    result = merchant.invoices

    assert_equal 3, result.size
  end

  def test_it_can_find_items
    repo = engine.merchant_repository
    merchant = repo.id(1)
    result = merchant.items

    assert_equal 15, result.size
  end

  def test_it_can_find_its_revenue
    repo = engine.merchant_repository
    merchant = repo.id(1)
    result = merchant.revenue

    assert_equal 21067.77, result
  end

  # def test_it_can_find_its_total_items
  #   repo = engine.merchant_repository
  #   merchant = repo.id(1)
  #   result = merchant.total_items

  #   assert_equal 47, result
  # end

  # def test_it_can_find_its_revenue_for_a_date
  #   repo = engine.merchant_repository
  #   merchant = repo.id(2)
  #   result = merchant.revenue(Date.parse("2012-03-12"))

  #   assert_equal 5289.13, result
  # end

  # def test_it_can_find_its_favorite_customer
  #   repo = engine.merchant_repository
  #   merchant = repo.id(2)
  #   result = merchant.favorite_customer

  #   assert_equal "Joey", result.first_name
  # end

  # def test_it_can_find_customers_with_pending_invoices
  #   repo = engine.merchant_repository
  #   merchant = repo.id(1)
  #   result = merchant.customers_with_pending_invoices

  #   assert_equal ["Leanne"], result.map { |customer| customer
  #                                             .first_name }
  # end

end
