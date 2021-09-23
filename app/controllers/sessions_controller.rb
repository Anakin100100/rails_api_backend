class SessionsController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def login 
    if User.where(email: params[:email]).empty?
      render :json => {
        "message": "user with this email doesn't exist"
      }, :status => :bad_request
    else
      @user = User.find(User.where(email: params[:email]).first.id.to_i)
      if @user.valid_password?(params[:password])
        @user.authentication_token = nil 
        @user.save
        render :json => {
          "authentication_token": @user.authentication_token,
          "id": @user.id
        }, :status => :accepted
      else
        render :json => {
          "message": "wrong password"
        }, :status => :bad_request
      end
    end
  end 

  def logout
    if User.where(id: params[:id]).empty?
      render :json => {
        "message": "user with this id doesn't exist"
      }, :status => :bad_request
    else
      @user = User.find(params[:id])
      if @user.authentication_token == params[:authentication_token]
        @user.authentication_token = nil 
        @user.save
        render :json => {
          "message": "logged out succesfully"
        }, :status => :accepted
      else
        render :json => {
          "message": "wrong authentication token"
        }, :status => :bad_request
      end
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :authentication_token, :id)
  end
end