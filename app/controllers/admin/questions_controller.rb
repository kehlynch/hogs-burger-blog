class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to admin_questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:answer)
  end
end
