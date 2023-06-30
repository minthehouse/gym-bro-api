class CreateMealTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_types do |t|
      t.string :name
      t.string :display_name
      t.timestamps
    end
  end
end
