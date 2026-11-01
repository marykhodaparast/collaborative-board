class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:pages).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      @board.pages.create!(name: "Page 1", position: 1)

      redirect_to board_path(@board), notice: "Board created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  @board = Board.includes(pages: :drawings).find(params[:id])

  if session[:nickname].blank?
    redirect_to new_board_nickname_path(@board)
  else
    @nickname = session[:nickname]
  end
end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
