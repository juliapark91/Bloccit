class Comment < ActiveRecord::Base
  belongs_to :post #opposite of has_many in Post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user_id, presence: true
end
