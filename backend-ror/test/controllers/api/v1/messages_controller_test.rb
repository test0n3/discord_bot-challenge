require "test_helper"

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_messages_index_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_messages_update_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_messages_create_url
    assert_response :success
  end
end
