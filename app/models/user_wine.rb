class UserWine < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 6}, allow_nil: true

  def self.top_saved_wine
    UserWine.all.group(:wine).order('wine_id desc').count.first[0]
  end



end
