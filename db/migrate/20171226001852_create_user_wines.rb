class CreateUserWines < ActiveRecord::Migration[5.1]
  def change
    create_table :user_wines do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :wine, foreign_key: true

      t.timestamps
    end
  end
end
