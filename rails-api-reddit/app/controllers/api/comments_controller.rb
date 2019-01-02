class Api::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      render :ok, json: {}
    else
      @errors = @comment.errors.full_messages
      render :unprocessable_entity, json: {message: @errors}
    end
  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

end
