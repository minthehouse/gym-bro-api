class RemovePwFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :pw, :string
  end
end
