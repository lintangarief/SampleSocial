Rails.application.routes.draw do
  get 'timelines/index'

  devise_for :users, controllers: { sessions: "users/sessions", confirmations: "users/confirmations", passwords: "users/passwords", registrations: "users/registrations", unlocks: "users/unlocks" } do
  end
  root :to => 'statics#home'
  resources :status

  resources :timelines do
    collection do
      post :create_status
      post :create_comment
      post :toggle_likes
    end
  end
end
