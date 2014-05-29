class AdminController < ApplicationController
  before_action :signed_in_admin

  def main
  end

  private

    def signed_in_admin
      redirect_to signin_path unless signed_in?
    end
end
