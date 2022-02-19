Rails.application.routes.draw do
  devise_for :users
  root 'tops#top'
  
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get "getfollowes" => "relationships#getfollowes"
    get "getfollowers" => "relationships#getfollowers"
  end
  
  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
