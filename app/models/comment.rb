class Comment < ActiveRecord::Base
  belongs_to :post #opposite of has_many in Post
  belongs_to :user
end
