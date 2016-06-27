class Idea < ActiveRecord::Base
  mount_uploaders :images, ImageUploader
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :members, dependent: :destroy
  has_many :user_members, through: :members, source: :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by_user_id(user)
  end

  def member_by?(user)
    members.exists?(user: user)
  end

  def member_for(user)
    members.find_by_user_id(user)
  end

end
