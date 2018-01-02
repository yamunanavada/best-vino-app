class User < ApplicationRecord
  has_many :user_wines
  has_many :wines, through: :user_wines
  has_many :friendships
  has_many :friends, through: :friendships, :foreign_key => 'friend_id'
  accepts_nested_attributes_for :wines
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validate :twenty_one?

  #may need to do some accepts_nested_attributes_for :wine

  def twenty_one?
    oldenough = Date.today - 21.years
    if !(self.birthday < oldenough)
      errors.add(:birthday, "must be older than 21")
    end
  end

  def self.search(search)
    @users= User.where(username: search)
  end



end
