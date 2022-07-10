class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]
  before_action :correct_post, only: [:edit]
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
    @time = Time.current
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end
  
  def search
    @results = Post.ransack(params[:q]).result(distinct: true)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:area, :name, :address, :body, :latitude, :longitude, :image, :rate, tag_ids: [])
  end
  
  def correct_post
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path
    end
  end
  
  def set_q
    @q = Post.ransack(params[:q])
  end
end
