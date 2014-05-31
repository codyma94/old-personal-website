class Admin::BlogpostsController < ApplicationController
  before_filter :signed_in
  layout "admin"

  def index
    @blogposts = current_admin.blogposts.where(public: 'true')
  end

  private

    def signed_in
      redirect_to signin_path unless signed_in?
    end
end
