class QuestionCommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question_comment = @question.question_comments.create(question_comment_params)
    redirect_to questions_path
  end

  private

  def question_comment_params
    params.require(:question_comment).permit(:commenter, :body)
  end
end
