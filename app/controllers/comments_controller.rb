class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build
    authorize @post
  end

  def create
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      # redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      # redirect_to [@post.topic, @post]
    end

    #destroying with ajax
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_post
    @post =  Post.find( params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

