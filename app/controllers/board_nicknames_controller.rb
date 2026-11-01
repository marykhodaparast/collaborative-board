class BoardNicknamesController < ApplicationController
  before_action :set_board

  def new
  end

  def create
    nickname = params[:nickname].to_s.strip

    if nickname.blank?
      flash.now[:alert] = "Please enter a nickname."
      render :new, status: :unprocessable_entity
      return
    end

    if nickname.length > 30
      flash.now[:alert] = "Nickname must be 30 characters or fewer."
      render :new, status: :unprocessable_entity
      return
    end

    session[:nickname] = nickname

    redirect_to board_path(@board)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end