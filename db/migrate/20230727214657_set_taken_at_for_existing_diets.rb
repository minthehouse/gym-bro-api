class SetTakenAtForExistingDiets < ActiveRecord::Migration[7.0]
  def up
    # Loop through existing diet records and set the taken_at attribute
    Diet.find_each do |diet|
      diet.update(taken_at: diet.created_at)
    end
  end
end
