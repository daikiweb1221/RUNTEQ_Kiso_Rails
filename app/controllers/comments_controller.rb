class CommentsController < ApplicationController

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to board_path(comment.board), success: t('.success')
    else
      redirect_to board_path(comment.board), danger: t('.fail')
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
