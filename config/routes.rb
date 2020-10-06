Rails.application.routes.draw do
  resources :owners, except: [:edit, :update]
end
