class Post < ActiveRecord::Base

  include Mixpanel

  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  after_create :track_post

  private

  def track_post
    tracker ||= Mixpanel::Tracker.new( ENV['PROJECT_TOKEN'] )
    tracker.track( user_id, 'Created Post' )
  end
end
