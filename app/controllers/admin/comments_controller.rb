class Admin::CommentsController < Admin::BaseController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to admin_posts_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
