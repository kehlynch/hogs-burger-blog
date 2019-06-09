class WelcomeController < ApplicationController
  helper_method :sort_column, :sort_direction, :search

  def index
    # if sort_direction
    #   @posts = Post.order("#{sort_column} #{sort_direction}")
    # end
    @posts = Post.search(params[:search])
    if sort_direction != ""
      @posts = @posts.order("#{sort_column} #{sort_direction}")
    end
    @posts
  end

  def post_params
    params.require(:post).permit(:search)
  end

  private

  def sortable_columns
    ["rating", "updated_at"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "rating"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : ""
  end
  
  def search
    params[:search]
  end
end
