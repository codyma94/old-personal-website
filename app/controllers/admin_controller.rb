class AdminController < ApplicationController
  before_action :signed_in_admin
  # should probably have a check for the correct admin
  layout "admin"

  def main
    @blogposts = current_admin.blogposts.where(public: 'true').to_a
  end

  private

    def signed_in_admin
      redirect_to signin_path unless signed_in?
    end
end
