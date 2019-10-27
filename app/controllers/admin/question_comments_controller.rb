class Admin::QuestionCommentsController < Admin::BaseController
  def index
    @question = Question.find(params[:question_id])
    @question_comments = @question.question_comments
  end

  def destroy
    @question = Question.find(params[:question_id])
    @question_comment = @question.question_comments.find(params[:id])
    @question_comment.destroy
    redirect_to admin_questions_path(@question)
  end

  def create
    @question = Question.find(params[:question_id])
    @question_comment = @post.question_comments.create(question_comment_params)
    redirect_to admin_questions_path(@question)
  end

  private

  def question_comment_params
    params.require(:question_comment).permit(:body, :by_the_hog)
  end
end
