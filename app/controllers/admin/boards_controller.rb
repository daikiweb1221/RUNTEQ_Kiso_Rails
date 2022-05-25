class Admin::BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :show, :update, :destroy]

  def index
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @board.update(board_params)
    redirect_to admin_boards_path(@board), success: t('.success')
    else
    flash.now[:danger] = t('.fail')
    render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: t('.delete')
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(
      :title,
      :body,
      :board_image,
      :board_image_cache,
    )
  end
end
