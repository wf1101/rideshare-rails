class AddColumnPassenge < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :location, :string
    add_column :passengers, :email, :string
  end
end
