Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resource :users, only: :show
      post '/user/like', to: 'users#like'
      post '/user/pass', to: 'users#pass'
      get '/user/favoriting', to: 'users#favoriting'
      get '/user/matching', to: 'users#matching'
    end
  end
end
