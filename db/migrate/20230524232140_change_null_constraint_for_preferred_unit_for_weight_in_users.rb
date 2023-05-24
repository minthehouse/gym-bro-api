class ChangeNullConstraintForPreferredUnitForWeightInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :preferred_unit_for_weight, true
  end
end
