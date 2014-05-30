class AddBlogpostAuthor < ActiveRecord::Migration
  def change
    add_column :blogposts, :author, :string
  end
end
