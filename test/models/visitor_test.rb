require "test_helper"

class VisitorTest < ActiveSupport::TestCase
  test "válido com campos obrigatórios" do
    visitor = Visitor.new(
      name: "Maria Silva",
      email: "maria@mail.com"
    )
    assert visitor.valid?
  end

  test "inválido sem nome" do
    visitor = Visitor.new(email: "test@mail.com")
    assert_not visitor.valid?
    assert_includes visitor.errors[:name], "can't be blank"
  end

  test "email inválido deve falhar" do
    visitor = Visitor.new(
      name: "João",
      email: "email_invalido"
    )
    assert_not visitor.valid?
  end
end
