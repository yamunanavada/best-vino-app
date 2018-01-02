class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :difficult_level
      t.float :cost

      t.timestamps
    end
  end
end
