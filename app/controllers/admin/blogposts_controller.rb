class Admin::BlogpostsController < ApplicationController
  before_filter :signed_in
  layout "admin"

  def index
    @new_blogpost = current_admin.blogposts.build
    @blogposts = current_admin.blogposts.all
  end

  def create
    @blogpost = current_admin.blogposts.build(blogpost_params)
    if @blogpost.save
      redirect_to admin_path
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Post updated"
      redirect_to [:admin, @blogpost]
    else
      render "edit"
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:id])
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
