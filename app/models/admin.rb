# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#

class Admin < ActiveRecord::Base

  has_many :blogposts, dependent: :destroy

  before_create :create_remember_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 64 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, length: { minimum: 8 }

  def Admin.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Admin.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Admin.digest(Admin.new_remember_token)
    end

end
