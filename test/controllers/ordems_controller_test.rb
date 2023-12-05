require "test_helper"

class OrdemsControllerTest < ActionDispatch::IntegrationTest
  test "should get mostrar" do
    get ordems_mostrar_url
    assert_response :success
  end
end
