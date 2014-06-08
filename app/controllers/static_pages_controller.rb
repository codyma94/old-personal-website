class StaticPagesController < ApplicationController
  def home
    @blogposts = Blogpost.all.where(:public => false)
  end
end
