require 'test_helper'

class BankTransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_transaction_index_url
    assert_response :success
  end

end
