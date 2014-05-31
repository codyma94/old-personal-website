# == Schema Information
#
# Table name: blogposts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer
#  public     :boolean
#

class Blogpost < ActiveRecord::Base

  belongs_to :admin
  default_scope -> { order('created_at DESC') }

  validates :admin_id, presence: true
  validates :title, presence: true, length: {maximum: 128}
  validates :content, presence: true

end
