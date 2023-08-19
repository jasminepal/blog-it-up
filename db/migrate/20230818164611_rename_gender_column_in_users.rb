class RenameGenderColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :gender, :old_gender
  end
end
