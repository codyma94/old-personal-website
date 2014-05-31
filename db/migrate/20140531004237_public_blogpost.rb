class PublicBlogpost < ActiveRecord::Migration
  def change
    remove_column :blogposts, :author
    add_column :blogposts, :author_id, :integer
    add_column :blogposts, :public, :boolean
    add_index :blogposts, [:author_id, :created_at]
  end
end
