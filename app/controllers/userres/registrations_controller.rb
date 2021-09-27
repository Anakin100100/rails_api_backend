module Userres
  class RegistrationsController < ApplicationController
    respond_to :json
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def register 
      params = body_read
      email = params[:user][:email]
      if User.where(email: email).empty?
        password = params[:user][:password]
        confirmation = params[:user][:password_confirmation]
        @user = User.new(:email => email, :password => password, :password_confirmation => confirmation)
        if @user.save
          render :json => {
            "user": @user
          }, :status => :accepted
        else
          render :json => {
            "message": "unable to register user"
          }, :status => :bad_request
        end
      else
        render :json => {
          "message": "user with this email already exists"
        }, :status => :bad_request
      end
    end

    def unregister
      params = body_read
      if User.where(id: params[:user][:id]).empty?
        render :json => {
          "message": "unable to unregister user"
        }, :status => :bad_request
      else
        @user = User.find(params[:user][:id])
        if @user.authentication_token == params[:user][:authentication_token]
          @user.destroy
          render :json => {
            "message": "User unregistered"
          }, :status => :accepted
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