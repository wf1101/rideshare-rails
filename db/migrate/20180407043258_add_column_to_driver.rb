class AddColumnToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :car_make, :string
    add_column :drivers, :car_year, :int
    add_column :drivers, :status, :boolean
  end
end
