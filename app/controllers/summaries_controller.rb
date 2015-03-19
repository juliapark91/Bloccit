class SummariesController < ApplicationController
def show
    @summary = Summary.find(params[:id])
    #@post = Post.find(params[:post_id])
    #@topic = Topic.find(params[:topic_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = current_user.summaries.build(params.require(:summary).permit(:body))
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end
end