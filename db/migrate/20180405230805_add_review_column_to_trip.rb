class AddReviewColumnToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :review, :string
  end
end
