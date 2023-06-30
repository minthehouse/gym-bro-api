class RenameFoodTypeModelToFoodCategoryModel < ActiveRecord::Migration[7.0]
  def change
    rename_table :food_types, :food_categories
  end
end
