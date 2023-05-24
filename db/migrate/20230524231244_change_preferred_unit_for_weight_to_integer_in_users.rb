class ChangePreferredUnitForWeightToIntegerInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :preferred_unit_for_weight, :integer, default: 0, null: false
  end
end
