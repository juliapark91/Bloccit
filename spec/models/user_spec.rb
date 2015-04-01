require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
      @favorited = @user.favorited(@post)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect( @favorited ).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do 
      @favorite = Favorite.where(user_id: @user.id, post_id: @post.id).first
      expect( @favorite).to eq(@favorited)
    end

    it "returns `nil` if the user has favorited another post" do
      unless @favorited = @favorite
        expect(@favorited ).to eq(nil)
      end      
    end
  end
end