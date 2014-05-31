class ChangeAuthorToAdmin < ActiveRecord::Migration
  def change
    remove_column :blogposts, :author_id
    add_column :blogposts, :admin_id, :integer
  end
end
