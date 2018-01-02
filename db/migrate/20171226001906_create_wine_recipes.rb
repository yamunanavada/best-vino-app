class CreateWineRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :wine_recipes do |t|
      t.belongs_to :wine, foreign_key: true
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
