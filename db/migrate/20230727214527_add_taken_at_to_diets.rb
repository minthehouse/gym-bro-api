class AddTakenAtToDiets < ActiveRecord::Migration[7.0]
  def change
    add_column :diets, :taken_at, :datetime
  end
end
