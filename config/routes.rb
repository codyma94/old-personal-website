Rails.application.routes.draw do

  root 'static_pages#home'

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    match '', to: 'blogposts#index', via: 'get', as: '/'
    resources :blogposts
  end

  match '/admin/signin', to: 'sessions#new', via: 'get', as: 'signin'
  match '/admin/signout', to: 'sessions#destroy', via: 'delete', as: 'signout'

end
