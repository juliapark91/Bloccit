class SummariesController < ApplicationController
  
  before_action :set_post

  def show
    @summary = @post.summary
  end

  def new
    @summary = @post.build_summary
  end

  def create
    @summary = @post.build_summary( summary_params )
    
    if @summary.save
      flash[:notice] = "Summary was sucessfully created."
      redirect_to [ @topic, @post, @summary ]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

private
  
  def set_post
    @topic = Topic.find( params[:topic_id] )
    @post =  Post.find( params[:post_id])
  end
    
  def summary_params
    params.require(:summary).permit(:body)
  end
end
