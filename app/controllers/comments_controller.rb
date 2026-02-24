class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.create!(comment_params)
    render json: comment, status: :created
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_comment_id)
  end
end
