class AddPreferredUnitForWeightToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_unit_for_weight, :integer
  end
end
