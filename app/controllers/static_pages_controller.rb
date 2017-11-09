class StaticPagesController < ApplicationController
  def home
  end 

  def about
  end

  def feed
    @posts = Post.all
  end 
end
