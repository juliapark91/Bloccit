class FavoritesController < ApplicationController

#before_action :set_favorite  
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize favorite
    if favorite.save
      flash[:notice] = "Successfully favorited post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error favoriting post."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize favorite
    if favorite.destroy
      flash[:notice] = "Successfully unfavorited post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error unfavoriting post."
      redirect_to [@post.topic, @post]
    end
  end
end

  #private

  #def set_favorite
    #@post = Post.find(params[:post_id])
    #@favorite = current_user.favorites.build(post: @post)
  #end

