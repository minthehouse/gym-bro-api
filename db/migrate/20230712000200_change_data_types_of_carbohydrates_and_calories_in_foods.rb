class ChangeDataTypesOfCarbohydratesAndCaloriesInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :carbohydrates, :decimal, precision: 10, scale: 2
    change_column :foods, :calories, :decimal, precision: 10, scale: 2
  end
end
