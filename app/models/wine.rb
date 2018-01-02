class Wine < ApplicationRecord
  has_many :wine_recipes
  has_many :recipes, through: :wine_recipes
  has_many :user_wines
  has_many :users, through: :user_wines
  accepts_nested_attributes_for :recipes, :reject_if => :all_blank
  accepts_nested_attributes_for :users, :reject_if => :all_blank
  accepts_nested_attributes_for :user_wines, :reject_if => :all_blank

  validates :name, presence: true
  validates :price, presence: true, numericality: {minimum: 0.01}
  validates :country, presence: true

  def user_wines_attributes=(user_wines_attributes)

      user_wine = UserWine.find_or_create_by(user_wines_attributes.values[0]["user_id"])
      user_wine.update(rating: user_wines_attributes.values[0]["rating"])

  end


  def rating
    rating = UserWine.where(wine: self).average("rating").to_f
    if rating == 0.0 || rating == nil
      "This wine has not been rated yet."
    end
    rating
  end







end
