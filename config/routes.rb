Rails.application.routes.draw do

  get 'home/contacts'
  get 'home/index'
  get 'terms/new'
  get 'about/new'
  get 'articles/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :articles
  resources :home, path_names: {:index => ''}
  resource :contacts, only: [:new, :create], path_names: { :new => ''} #чтобы вид new выводился по ссылке /contacts, а не /contacts/new
  resource :terms, path_names: {:new => ''}
  resources :about, path_names: {:new => ''}

end
