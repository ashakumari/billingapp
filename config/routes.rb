Rails.application.routes.draw do
  resources :bills do
  	resources :bill_items
  end

  get '/reports' => 'reports#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
