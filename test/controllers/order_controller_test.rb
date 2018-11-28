require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_index_url
    assert_response :success
  end

  test "should get show" do
    get order_show_url
    assert_response :success
  end

  test "should get destroy" do
    get order_destroy_url
    assert_response :success
  end

  test "should get checkout" do
    get order_checkout_url
    assert_response :success
  end

end
