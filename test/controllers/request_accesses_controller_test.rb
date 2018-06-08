require 'test_helper'

class RequestAccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_access = request_accesses(:one)
  end

  test "should get index" do
    get request_accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_request_access_url
    assert_response :success
  end

  test "should create request_access" do
    assert_difference('RequestAccess.count') do
      post request_accesses_url, params: { request_access: { status: @request_access.status } }
    end

    assert_redirected_to request_access_url(RequestAccess.last)
  end

  test "should show request_access" do
    get request_access_url(@request_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_access_url(@request_access)
    assert_response :success
  end

  test "should update request_access" do
    patch request_access_url(@request_access), params: { request_access: { status: @request_access.status } }
    assert_redirected_to request_access_url(@request_access)
  end

  test "should destroy request_access" do
    assert_difference('RequestAccess.count', -1) do
      delete request_access_url(@request_access)
    end

    assert_redirected_to request_accesses_url
  end
end
