class PostsController < ApplicationController

before_action :set_topic

  def show
    @post = Post.find(params[:id])
    authorize @post
    @comments = @post.comments
  end

  def new
    @post = @topic.posts.build
    authorize @post
  end

  def create
    @post = @topic.posts.build(post_params.merge( user_id: current_user.id ) )
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end

private

def post_params
  params.require(:post).permit(:title, :body)
end

def set_topic
  @topic = Topic.find(params[:topic_id])
end
