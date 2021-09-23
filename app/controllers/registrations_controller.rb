class RegistrationsController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def register
    email = params[:email]
    if User.where(email: email).empty?
      password = params[:password]
      confirmation = params[:password_confirmation]
      @user = User.new(:email => email, :password => password, :password_confirmation => confirmation)
      if @user.save
        render :json => {
          "authentication_token": @user.authentication_token,
          "id": @user.id
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
    if User.where(id: params[:id]).empty?
      render :json => {
        "message": "unable to unregister user"
      }, :status => :bad_request
    else
      @user = User.find(params[:id])
      if @user.authentication_token == params[:authentication_token]
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
end