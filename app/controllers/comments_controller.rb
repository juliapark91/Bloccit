class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build
    authorize @post
  end

  def create
    @comment = @post.comments.build(comment_params.merge( user_id: current_user.id ))
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end

  private

  def set_post
    @post =  Post.find( params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end

