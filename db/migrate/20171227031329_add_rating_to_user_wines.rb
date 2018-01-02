class AddRatingToUserWines < ActiveRecord::Migration[5.1]
  def change
    add_column :user_wines, :rating, :integer
  end
end
