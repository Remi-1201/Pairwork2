class RemoveImageToBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :image, :text
  end
end
