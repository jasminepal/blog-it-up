class AddAttributesToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :content, :text
    add_column :blogs, :image, :string
    add_column :blogs, :gender, :string
  end
end
