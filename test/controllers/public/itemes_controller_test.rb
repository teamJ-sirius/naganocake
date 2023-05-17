require "test_helper"

class Public::ItemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_itemes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_itemes_show_url
    assert_response :success
  end
end
