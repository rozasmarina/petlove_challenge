Rails.application.routes.draw do
  resources :owners, except: %i[index edit update]

  root to: 'owners#new'
end
