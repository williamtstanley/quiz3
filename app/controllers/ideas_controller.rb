class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new idea_params
    user = current_user
    idea.user = user
    if idea.save
      redirect_to idea_path(idea)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.order(created_at: :desc)
  end
  # @tickets = SupportTicket.order(created_at: :desc)

  def index
      @ideas = Idea.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end



  private

    def idea_params
      params.require(:idea).permit(:title, :body, {images: []})
    end

    def find_idea
      @idea = Idea.find params[:id]
    end
end
