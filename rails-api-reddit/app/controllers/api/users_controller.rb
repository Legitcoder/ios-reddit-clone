class Api::UsersController < ApplicationController

  def index
    @users = User.all
  end

  #Sign up new user
  def create
    @user = User.new(user_params)
    if @user.save
      render :ok, json: @controller.to_json
    else
      @errors = @user.errors.full_messages
      render json: { message: @errors }, status: :unauthorized
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
