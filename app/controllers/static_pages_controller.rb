class StaticPagesController < ApplicationController
  def home
  end 

  def about
  end

  def feed
      @posts = Post.includes(:user).includes(comments: [:user])
  end 
end
