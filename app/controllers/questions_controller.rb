class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction, :search

  def index
    @question = Question.new
    @questions = questions
  end

  def question_params
    params.require(:question).permit(:search, :body, :author)
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Thank you. The Hog will respond to your burger related query at his lesuire."
      redirect_to action: :index
    else
      flash[:error] = "Sorry, your burger related query could not be saved at this time."
      @questions = questions
      render 'index'
    end
  end

  private

  def questions
    questions = Question.search(params[:search])
    if sort_direction != ''
      questions = questions.order("#{sort_column} #{sort_direction}")
    else
      questions = questions.order("updated_at desc")
    end
    questions
  end

  def sortable_columns
    %w[updated_at]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'rating'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : ''
  end

  def search
    params[:search]
  end
end
