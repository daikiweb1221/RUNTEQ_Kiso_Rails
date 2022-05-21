class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :update, :destroy]

  def index
    @search = Board.ransack(params[:q])
    @boards = @search.result(distinct: true).includes(%i[user bookmarks]).order(created_at: :desc).page(params[:page])
    # @boards = Board.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
  end
end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @board.update(board_params)
    redirect_to @board, success: t('.success')
    else
    flash.now[:danger] = t('.fail')
    render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('.delete')
  end

  def bookmarks
    @search = current_user.bookmark_boards.ransack(params[:q])
    @bookmark_boards = @search.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    # @bookmark_boards = current_user.bookmark_boards.includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def set_board
    @board = current_user.boards.find(params[:id])
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
