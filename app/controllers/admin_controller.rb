class AdminController < ApplicationController
  before_filter :admin?
  def main
  end

  private

    def admin?
      unless logged_in?
        redirect_to root_url
      end
    end
end
