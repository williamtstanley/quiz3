class CommentsController < ApplicationController

  def create
        @comment = Comment.new comment_params
        @idea = Idea.find params[:idea_id]
        @comment.idea = @idea
        @comment.user = current_user
        if @comment.save
          CommentsMailer.notify_idea_owner(@comment).deliver_later
          redirect_to idea_path(@idea), notice: "Comment created!"
        else
            render "ideas/show"
        end
    end

    def destroy
      @idea = Idea.find params[:idea_id]
      @comment = Comment.find params[:id]
      @comment.destroy
      redirect_to idea_path(@idea), notice: "Comment deleted"
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :idea_id)
    end


end
