class StaticPagesController < ApplicationController
  def home
    @blogposts = Blogpost.all.where(:public => true)
  end
end
