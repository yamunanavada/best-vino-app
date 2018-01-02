class Recipe < ApplicationRecord
  has_many :wine_recipes
  has_many :wines, through: :wine_recipes
  # validates :name, presence: true, uniqueness: true
  # validates :difficult_level, presence: true
  # validates :cost, presence: true, numericality: {minimum: 0}
  accepts_nested_attributes_for :wines

  def self.difficulty
    [["easy",1],["very easy",2],["very hard",3],["hard",4],["medium",5],["impossible",6]]
  end

end
