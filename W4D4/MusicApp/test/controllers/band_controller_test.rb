require 'test_helper'

class BandControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get band_index_url
    assert_response :success
  end

  test "should get create" do
    get band_create_url
    assert_response :success
  end

  test "should get new" do
    get band_new_url
    assert_response :success
  end

  test "should get edit" do
    get band_edit_url
    assert_response :success
  end

  test "should get show" do
    get band_show_url
    assert_response :success
  end

  test "should get update" do
    get band_update_url
    assert_response :success
  end

  test "should get destroy" do
    get band_destroy_url
    assert_response :success
  end

end
