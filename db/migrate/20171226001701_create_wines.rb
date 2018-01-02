class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :country
      t.integer :year
      t.float :price

      t.timestamps
    end
  end
end
