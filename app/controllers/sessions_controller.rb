class SessionsController < ApplicationController
  before_action :signed_in, only: [:new, :create]
  layout "admin"

  def new
  end

  def create
    admin = Admin.find_by_email(params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_to admin_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to admin_path 
  end

  private

    def signed_in
      if signed_in?
        redirect_to admin_path
      end
    end

end
