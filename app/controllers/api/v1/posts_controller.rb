class Api::V1::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show 
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render error: {error: "error"}, status: 400
    end
  end

  private 

  def post_params
    params.require(:post).permit(:post, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end






end
