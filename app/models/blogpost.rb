class Blogpost < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 128}, uniqueness: { case_sensitive: false }
  validates :content, presence: true
end
