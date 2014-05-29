module SessionsHelper

  def sign_in(admin)
    remember_token = Admin.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    admin.update_attribute(:remember_token, Admin.digest(remember_token))
    self.current_admin = admin
  end

  def signed_in?
    !current_admin.nil?
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  def current_admin
    remember_token ||= Admin.digest(cookies[:remember_token])
    @current_admin ||= Admin.find_by(remember_token: remember_token)
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end
