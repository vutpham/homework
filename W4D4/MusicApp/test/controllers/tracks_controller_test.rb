require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tracks_new_url
    assert_response :success
  end

  test "should get create" do
    get tracks_create_url
    assert_response :success
  end

  test "should get edit" do
    get tracks_edit_url
    assert_response :success
  end

  test "should get showupdate" do
    get tracks_showupdate_url
    assert_response :success
  end

  test "should get destroy" do
    get tracks_destroy_url
    assert_response :success
  end

end
