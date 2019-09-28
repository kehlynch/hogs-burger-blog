class Admin::QuestionsController < Admin::BaseController
  include HttpAuthConcern

  def index
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to admin_questions_path
  end
end
