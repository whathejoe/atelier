require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get product" do
    get :product
    assert_response :success
  end

end
