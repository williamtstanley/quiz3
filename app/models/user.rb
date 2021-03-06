class User < ActiveRecord::Base
  has_secure_password
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :members, dependent: :destroy
  has_many :memberships, through: :members, source: :idea

  has_many :comments, dependent: :nullify
  
  has_many :ideas, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: VALID_EMAIL_REGEX, uniqueness: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end


end
