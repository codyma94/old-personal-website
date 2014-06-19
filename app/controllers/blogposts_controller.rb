class BlogpostsController < ApplicationController

  def index
    @blogposts = Blogpost.all.where(:public => true)
  end

end
