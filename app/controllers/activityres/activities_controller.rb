module Activityres
    class ActivitiesController < ApplicationController
        respond_to :json
        protect_from_forgery with: :null_session
        skip_before_action :verify_authenticity_token

        def create
            @body = body_read 
            if verify_user
                @activity = Activity.new
                @activity.name = @body[:activity][:name] 
                @activity.user_id = User.find(@body[:user][:id]).id 
                @activity.save
                render :json => {
                    "message": "activity added",
                    "activity": @activity
                }, :status => :accepted
            else
                render :json => {
                    "message": "User failed to authenticate with api"
                }, :status => :bad_request
            end
        end 

        def read
            @body = body_read 
            if verify_user
                if verify_ownership
                    render :json => {
                        "message": "activity fetched successfully",
                        "activity": Activity.find(@body[:activity][:id])
                    }, :status => :accepted
                else 
                    render :json => {
                        "message": "you don't have sufficient permissions to view this activity"
                    }, :status => :bad_request
                end
            else
                render :json => {
                    "message": "User failed to authenticate with api"
                }, :status => :bad_request
            end
        end 

        def update
            @body = body_read 
            if verify_user
                if verify_ownership
                    activity = Activity.find(@body[:activity][:id])
                    activity.name = @body[:activity][:name]
                    activity.save
                    render :json => {
                        "message": "activity updated successfully",
                    }, :status => :accepted
                else 
                    render :json => {
                        "message": "you don't have sufficient permissions to update this activity"
                    }, :status => :bad_request
                end
            else
                render :json => {
                    "message": "User failed to authenticate with api"
                }, :status => :bad_request
            end
        end 

        def delete
            @body = body_read   
            if verify_user
                if verify_ownership
                    activity = Activity.find(@body[:activity][:id])
                    activity.destroy
                    render :json => {
                        "message": "activity deleted successfully",
                    }, :status => :accepted
                else 
                    render :json => {
                        "message": "you don't have sufficient permissions to delete this activity"
                    }, :status => :bad_request
                end
            else
                render :json => {
                    "message": "User failed to authenticate with api"
                }, :status => :bad_request
            end
        end 

        def index
            activities = Activity.all 
            render :json => {
                "message": "activities listed successfully",
                "activities": activities
            }, :status => :accepted
        end

        private 

        def verify_user
            id = @body[:user][:id] 
            authentication_token = @body[:user][:authentication_token]
            user = User.find(id)
            if user.authentication_token == authentication_token
                return true
            else 
                return false 
            end
        end

        def verify_ownership
            activity_id = @body[:activity][:id] 
            user_id = @body[:user][:id]
            activity = Activity.find(activity_id)
            user = User.find(user_id)
            if user.id == activity.user_id 
                return true
            else  
                return false 
            end
        end

        def body_read
            raw_body = request.body.read
            hash_string_keys_body = JSON.parse raw_body
            hash_symbol_keys_body = hash_string_keys_body.deep_symbolize_keys 
            return hash_symbol_keys_body
        end
    end
end