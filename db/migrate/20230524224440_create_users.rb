class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :preferred_unit_for_weight
      t.integer :height
      t.decimal :weight

      t.timestamps
    end
  end
end
