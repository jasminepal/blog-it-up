class UpdateExistingUserGenders < ActiveRecord::Migration[7.0]
  def change
    def up
      User.update_all(gender: 0)
    end
  
    def down
      User.update_all(gender: nil)
    end
  end
end
