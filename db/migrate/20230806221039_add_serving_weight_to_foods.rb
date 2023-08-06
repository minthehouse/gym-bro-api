class AddServingWeightToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :serving_weight, :integer, default: 100
    # Update existing records to set the serving_weight to 100
    Food.update_all(serving_weight: 100)
  end
end
