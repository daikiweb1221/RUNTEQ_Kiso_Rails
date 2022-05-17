class BookmarksController < ApplicationController

  def index
    @boards = Board.all.includes([:user, :bookmarks]).order(created_at: desc)
  end

  # def create
  #   board = Board.find(params[:board_id])
  #   bookmark = current_user.bookmarks.build(board_id: params[:board_id])
  #   bookmark.save!
  #   redirect_to boards_path, success: t('.success')
  #   end

  # def destroy
  #   bookmark = current_user.bookmarks.find(params[:id])
  #   bookmark.destroy!
  #   redirect_to boards_path, success: t('.success')
  # end

  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
  end

  def destroy
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
  end
end
