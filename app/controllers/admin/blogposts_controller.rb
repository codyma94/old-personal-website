class Admin::BlogpostsController < ApplicationController
  before_filter :signed_in
  layout "admin"

  def index
    @blogpost = current_admin.blogposts.build if signed_in?
    @blogposts = current_admin.blogposts.all
  end

  def create
    @blogpost = current_admin.blogposts.build(blogpost_params)
    if @blogpost.save
      redirect_to admin_path
    end
  end

  def destroy
    @blogpost = Blogpost.find((params[:id]))
    if @blogpost.present?
      @blogpost.destroy
    end
    redirect_to admin_path
  end

  private

    def signed_in
      redirect_to signin_path unless signed_in?
    end

    def blogpost_params
      params.require(:blogpost).permit(:title, :content, :public)
    end
end
