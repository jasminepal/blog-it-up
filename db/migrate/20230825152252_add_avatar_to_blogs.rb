class AddAvatarToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :avatar, :string
  end
end
