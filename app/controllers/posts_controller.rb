class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:area, :name, :address, :body, :latitude, :longitude, :image, :rate, tag_ids: [])
  end
end
