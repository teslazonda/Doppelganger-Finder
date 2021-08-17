require 'test_helper'

class DoppelgangersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doppelgangers_index_url
    assert_response :success
  end

  test "should get new" do
    get doppelgangers_new_url
    assert_response :success
  end

  test "should get create" do
    get doppelgangers_create_url
    assert_response :success
  end

  test "should get show" do
    get doppelgangers_show_url
    assert_response :success
  end

end
