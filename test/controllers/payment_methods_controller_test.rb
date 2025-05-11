require "test_helper"

class PaymentMethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_methods_index_url
    assert_response :success
  end

  test "should get show" do
    get payment_methods_show_url
    assert_response :success
  end

  test "should get new" do
    get payment_methods_new_url
    assert_response :success
  end

  test "should get edit" do
    get payment_methods_edit_url
    assert_response :success
  end
end
