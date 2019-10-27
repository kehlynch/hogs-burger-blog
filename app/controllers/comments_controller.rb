# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
