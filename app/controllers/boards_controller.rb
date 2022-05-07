class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end
end
