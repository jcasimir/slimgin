require_relative 'test_helper'
require_relative '../lib/data_instance'

class DataInstanceTest < Minitest::Test
  def test_has_a_list_of_referable_attributes
    data = DataInstance.new nil, {}

    assert_kind_of Hash, data.referable
  end
end
