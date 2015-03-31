class Party < ActiveRecord::Base
  has_many :guests, dependent: :destroy

  default_scope { order('starttime ASC')}
end
