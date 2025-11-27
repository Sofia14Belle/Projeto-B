require "test_helper"

class SmokeTest < ActionDispatch::IntegrationTest
  test "root responde com sucesso" do
    get "/"
    assert_response :success
  end
end
