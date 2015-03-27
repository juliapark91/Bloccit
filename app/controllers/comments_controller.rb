class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build
    authorize @post
    authorize @comment
  end

  def create
    @comment = @post.comments.build(comment_params.merge( user_id: current_user.id ))
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  private

  def set_post
    @topic = Topic.find( params[:topic_id] )
    @post =  Post.find( params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end

