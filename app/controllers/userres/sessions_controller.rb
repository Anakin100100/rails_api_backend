module Userres
  class SessionsController < ApplicationController
    respond_to :json
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def login 
      params = body_read
      if User.where(email: params[:user][:email]).empty?
        render :json => {
          "message": "user with this email doesn't exist"
        }, :status => :bad_request
      else
        @user = User.find(User.where(email: params[:user][:email]).first.id.to_i)
        if @user.valid_password?(params[:user][:password])
          @user.authentication_token = nil 
          @user.save
          render :json => {
            "user": @user
          }, :status => :accepted
        else
          render :json => {
            "message": "wrong password"
          }, :status => :bad_request
        end
      end
    end 

    def logout
      params = body_read
      if User.where(id: params[:user][:id]).empty?
        render :json => {
          "message": "user with this id doesn't exist"
        }, :status => :bad_request
      else
        @user = User.find(params[:user][:id])
        if @user.authentication_token == params[:user][:authentication_token]
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

    private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :email, :authentication_token, :id)
    end

    def body_read
      j = request.body.read
      j = JSON.parse j
      j = j.deep_symbolize_keys 
      return j
    end
  end
end