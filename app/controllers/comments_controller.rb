class CommentsController < ApplicationController
  def create
    @comment = @posts.build(comment_params.merge( user_id: current_user.id ) )
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post, @comment]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end
end