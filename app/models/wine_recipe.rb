class WineRecipe < ApplicationRecord
  belongs_to :wine
  belongs_to :recipe
end
