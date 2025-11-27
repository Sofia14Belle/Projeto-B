require "test_helper"

class VisitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visitor = Visitor.create!(name: "Ana", email: "ana@mail.com")
  end

  test "deve acessar index" do
    get visitors_url
    assert_response :success
  end

  test "deve acessar new" do
    get new_visitor_url
    assert_response :success
  end

  test "deve criar visitante válido" do
    assert_difference("Visitor.count") do
      post visitors_url, params: {
        visitor: {
          name: "Carlos",
          email: "carlos@mail.com"
        }
      }
    end

    assert_redirected_to visitor_path(Visitor.last)
  end

  test "não deve criar visitante inválido" do
    assert_no_difference("Visitor.count") do
      post visitors_url, params: {
        visitor: { name: "", email: "" }
      }
    end

    assert_response :unprocessable_entity
  end

  test "deve mostrar visitante" do
    get visitor_url(@visitor)
    assert_response :success
  end
end
