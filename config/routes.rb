Rails.application.routes.draw do
  get 'home/contacts'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles;
            :home

  resource :contacts, only: [:new, :create], path_names: { :new => ''} #чтобы вид new выводился по ссылке /contacts, а не /contacts/new
end
