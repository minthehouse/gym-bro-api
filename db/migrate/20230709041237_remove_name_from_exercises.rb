class RemoveNameFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :name, :string
  end
end
