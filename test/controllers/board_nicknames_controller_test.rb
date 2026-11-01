require "test_helper"

class BoardNicknamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = Board.create!(title: "Test Board")
  end

  test "should get new" do
    get new_board_nickname_url(@board)

    assert_response :success
  end

  test "should save nickname in session and redirect to board" do
    post board_nickname_url(@board), params: {
      nickname: "Alex"
    }

    assert_equal "Alex", session[:nickname]
    assert_redirected_to board_url(@board)
  end

  test "should reject blank nickname" do
    post board_nickname_url(@board), params: {
      nickname: "   "
    }

    assert_response :unprocessable_entity
  end

  test "should reject nickname longer than 30 characters" do
    post board_nickname_url(@board), params: {
      nickname: "A" * 31
    }

    assert_response :unprocessable_entity
  end
end
