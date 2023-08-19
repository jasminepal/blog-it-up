class UpdateUserGender < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :integer, default: 0
    # User.update_all(gender: 0)
  end

end
