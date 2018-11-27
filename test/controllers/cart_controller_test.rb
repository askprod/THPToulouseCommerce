require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_index_url
    assert_response :success
  end

  test "should get show" do
    get cart_show_url
    assert_response :success
  end

  test "should get new" do
    get cart_new_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_destroy_url
    assert_response :success
  end

end
