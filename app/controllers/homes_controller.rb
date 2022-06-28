class HomesController < ApplicationController
  def top
    @random_posts = Post.order("RANDOM()").limit(3)
    @new_posts = Post.order(created_at: :desc).limit(5)
  end
end
