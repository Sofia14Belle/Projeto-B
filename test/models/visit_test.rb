require "test_helper"

class VisitTest < ActiveSupport::TestCase
  def setup
    @visitor = Visitor.create!(name: "Pedro", email: "pedro@mail.com")
  end

  test "registro de visita é válido com visitante" do
    visit = Visit.new(visitor: @visitor, check_in: Time.now)
    assert visit.valid?
  end

  test "visita aberta sem check_out é válida" do
    visit = Visit.create!(visitor: @visitor, check_in: Time.now)
    assert_nil visit.check_out
    assert visit.valid?
  end

  test "finalização de visita define check_out" do
    visit = Visit.create!(visitor: @visitor, check_in: Time.now)
    visit.update(check_out: Time.now + 1.hour)
    assert_not_nil visit.check_out
  end
end
