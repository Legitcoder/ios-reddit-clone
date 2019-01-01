class Api::PostsController < ApplicationController

  before_action :verify_jwt_token

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render :ok, json: {}
    else
      @errors = @post.errors.full_messages
      render json: { message: @errors }, status: :unprocessable_entity
    end
  end

  def show
    @post_comments = Post.find(params[:id]).comments
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
