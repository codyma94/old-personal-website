class StaticPagesController < ApplicationController
  def home
    @blogposts = Blogpost.all
  end
end
