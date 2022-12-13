require "test_helper"

class IncomingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incoming = incomings(:one)
  end

  test "should get index" do
    get incomings_url, as: :json
    assert_response :success
  end

  test "should create incoming" do
    assert_difference('Incoming.count') do
      post incomings_url, params: { incoming: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show incoming" do
    get incoming_url(@incoming), as: :json
    assert_response :success
  end

  test "should update incoming" do
    patch incoming_url(@incoming), params: { incoming: {  } }, as: :json
    assert_response 200
  end

  test "should destroy incoming" do
    assert_difference('Incoming.count', -1) do
      delete incoming_url(@incoming), as: :json
    end

    assert_response 204
  end
end
