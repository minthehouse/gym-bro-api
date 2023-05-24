class ChangeDataTypesOfHeightAndWeightInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :height, :float
    change_column :users, :weight, :float
  end
end
