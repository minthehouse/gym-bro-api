class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calories
      t.float :protein
      t.float :carbohydrates
      t.float :fat
      t.references :diet, foreign_key: true
      t.references :meal_type, foreign_key: true

      t.timestamps
    end
  end
end
