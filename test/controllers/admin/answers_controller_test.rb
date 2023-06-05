require "test_helper"

class Admin::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_answers_index_url
    assert_response :success
  end
end
