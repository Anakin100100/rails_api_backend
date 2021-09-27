Rails.application.routes.draw do
    get "/healthcheck" => "healthcheck#healthcheck"
    namespace :userres do
        get "/register" => "registrations#register"
        get "/unregister" => "registrations#unregister"
        get "/login" => "sessions#login"
        get "/logout" => "sessions#logout"
    end
    namespace :activityres do
        get "/create" => "activities#create"
        get "/read" => "activities#read"
        get "/update" => "activities#update"
        get "/delete" => "activities#delete"
        get "/index" => "activities#index"
    end
end