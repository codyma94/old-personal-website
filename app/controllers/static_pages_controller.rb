class StaticPagesController < ApplicationController

  def home
    @blogposts = Blogpost.all.where(:public => true)
  end

  def download_resume
    send_file(
      "#{Rails.root}/public/cody_ma_resume.pdf",
      filename: "cody_ma_resume.pdf",
      type: "application/pdf"
    )
  end

end
