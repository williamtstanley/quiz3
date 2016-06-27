Rails.application.routes.draw do
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :members, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  root "ideas#index"

  resources :users, only: [:new, :create, :edit, :show, :update]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
