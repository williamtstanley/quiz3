class LikesController < ApplicationController

  def create
    idea = Idea.find params[:idea_id]
    like = Like.new(user: current_user, idea: idea)
    if like.save
      redirect_to idea_path(idea)
    else
      redirect_to idea_path(idea)
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    like = Like.find(params[:id])
    like.destroy if can? :destroy, Like
    redirect_to idea_path(idea)
  end

  def index
    @ideas = current_user.like_ideas
  end

end
