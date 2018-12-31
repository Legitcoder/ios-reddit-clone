class Api::TokensController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      render json: {
          jwt: encode_token({id: @user.id, username: @user.username})
      }
    else
      head :not_found
    end
  end


  private

  def encode_token(payload={})
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

end
