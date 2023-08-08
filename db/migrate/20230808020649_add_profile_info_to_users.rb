class AddProfileInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :goal, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :height_in_feet, :integer
    add_column :users, :height_in_inches, :integer
    add_column :users, :weight, :integer
  end
end
