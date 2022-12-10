class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
