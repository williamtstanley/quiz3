class MembersController < ApplicationController

  def create
    idea = Idea.find params[:idea_id]
    member = Member.new(user: current_user, idea: idea)
    if member.save
      redirect_to idea_path(idea)
    else
      redirect_to idea_path(idea)
    end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    member = Member.find(params[:id])
    member.destroy if can? :destroy, Member
    redirect_to idea_path(idea)
  end

  def index
    @ideas = current_user.member_ideas
  end


end
