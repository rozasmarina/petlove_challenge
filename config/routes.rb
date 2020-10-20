Rails.application.routes.draw do
  root to: 'owners#new'
  resources :owners, except: %i[index edit update] do
    resources :pets, only: %i[new create]
  end
  resources :pets, only: %i[show destroy]
end
