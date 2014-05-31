Rails.application.routes.draw do

  root 'static_pages#home'

  resources :sessions, only: [:new, :create, :destroy]


  match '/admin', to: 'admin#main', via: 'get', as: 'admin'
  match '/admin/signin', to: 'sessions#new', via: 'get', as: 'signin'
  match '/admin/signout', to: 'sessions#destroy', via: 'delete', as: 'admin_signout'

end
