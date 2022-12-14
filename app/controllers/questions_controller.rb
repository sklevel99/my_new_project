class QuestionsController < ApplicationController
  before_action :set_topic, only: [:new, :create]
  def new
    @topic = Topic.find(params[:topic_id])
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.topic = @topic
    if @question.save
      redirect_to topic_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to topic_path(@question.topic), status: :see_other
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def question_params
    params.require(:question).permit(:title, :mcq, :answer, :explanation)
  end
end
