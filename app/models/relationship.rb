class Relationship < ApplicationRecord

  enum status: { unapproved: 0, allow: 1, decline: 2 }

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
