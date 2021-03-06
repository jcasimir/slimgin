require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  def test_it_knows_what_file_it_refers_to
    customer_repo = CustomerRepository.new nil, "./test/fixtures/customers.csv"

    assert_kind_of File, customer_repo.location
  end

  def test_retrieves_customer_from_database
    customer_repo = CustomerRepository.new nil, "./test/fixtures/customers.csv"

    assert_kind_of Customer, customer_repo.id(1)
  end

  def test_customer_retrieves_repository
    customer_repo = CustomerRepository.new nil, "./test/fixtures/customers.csv"

    customer = customer_repo.id(1)

    assert_kind_of CustomerRepository, customer.repository
  end
end
