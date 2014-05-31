class PublicDefaultFalse < ActiveRecord::Migration
  def change
    remove_column :blogposts, :public
    add_column :blogposts, :public, :boolean, default: false
  end
end
