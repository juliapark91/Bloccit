class CommentsController < ApplicationController
  before_action :set_post

  #def new
    #@comment = @post.comments.build
    #authorize @post
  #end

  def create
    @comment = @post.comments.build(params.require( user_id: current_user.id ) )
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post, @comment]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def set_post
    @topic = Topic.find( params[:topic_id] )
    @post =  Post.find( params[:post_id])
  end
end