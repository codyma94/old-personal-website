class BlogpostsController < ApplicationController
  before_filter :admin

  def new
    @blogpost = Blogpost.new
  end

  def create
  end

  def update
  end

  def delete
  end
end
