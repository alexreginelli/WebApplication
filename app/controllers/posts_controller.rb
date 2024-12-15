class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json // SQL injection attack
  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to posts_path, alert: "Post not found"
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new 
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed."
  end

  def search
    @posts = Post.where("title LIKE ?", "%#{params[:query]}%")
    render :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end