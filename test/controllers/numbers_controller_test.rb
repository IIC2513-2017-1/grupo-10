require 'test_helper'

class NumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get numbers_new_url
    assert_response :success
  end

  test "should get create" do
    get numbers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get numbers_destroy_url
    assert_response :success
  end

end
