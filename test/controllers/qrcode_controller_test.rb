require "test_helper"

class QrcodeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qrcode_new_url
    assert_response :success
  end

  test "should get show" do
    get qrcode_show_url
    assert_response :success
  end
end
