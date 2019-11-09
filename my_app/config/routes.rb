Rails.application.routes.draw do
    root 'api#index'

    resources :api
end
