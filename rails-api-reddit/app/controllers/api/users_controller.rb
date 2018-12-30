class Api::UsersController < ApplicationController

  #Sign up new user
  def create
    @user = User.new(params.permit(:username, :email, :password))
    if(@user.save)
      :ok
    else
      :bad_request
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
