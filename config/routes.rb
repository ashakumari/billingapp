Rails.application.routes.draw do
  resources :bills do
  	resources :bill_items

  	member do
  		get 'print'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
