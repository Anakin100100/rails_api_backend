Rails.application.routes.draw do
    post "/users" => "registrations#register"
    delete "/users" => "registrations#unregister"
    get "/login" => "sessions#login"
    get "/logout" => "sessions#logout"
    namespace :activityres do
        get "/create" => "activities#create"
        get "/read" => "activities#read"
        get "/update" => "activities#update"
        get "/delete" => "activities#delete"
        get "/index" => "activities#index"
    end
end