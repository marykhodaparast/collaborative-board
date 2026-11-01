require "test_helper"

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = Board.create!(title: "Test Board")
  end

  test "should get index" do
    get boards_url
    assert_response :success
  end

  test "should get new" do
    get new_board_url
    assert_response :success
  end

  test "should create board with its first page" do
    assert_difference("Board.count", 1) do
      assert_difference("Page.count", 1) do
        post boards_url, params: {
          board: { title: "New Test Board" }
        }
      end
    end

    created_board = Board.order(:id).last
    assert_equal "New Test Board", created_board.title
    assert_equal "Page 1", created_board.pages.first.name
    assert_redirected_to board_url(created_board)
  end

  test "should redirect to nickname form when showing a board without a nickname" do
    get board_url(@board)

    assert_redirected_to new_board_nickname_url(@board)
  end
end
