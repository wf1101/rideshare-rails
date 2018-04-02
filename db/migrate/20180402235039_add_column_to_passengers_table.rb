class AddColumnToPassengersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :name, :string
    add_column :passengers, :phone_num, :string
  end
end
