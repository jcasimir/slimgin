require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  def test_it_loads_customer_repostiory
    engine = SalesEngine.new

    engine.startup

    assert_kind_of CustomerRepository, engine.customer_repository
  end
end
