class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true

  attachment :profile_image

  def self.search(search)
      if search
        User.where(['name LIKE ?', "%#{search}%"])
      else
        User.all
      end
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def allow(user_id)
    reverse_of_relationships.find_by(follower_id: user_id).update(status: 1)
  end

  def decline(user_id)
    reverse_of_relationships.find_by(follower_id: user_id).destroy
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
