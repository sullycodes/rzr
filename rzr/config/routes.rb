Rails.application.routes.draw do
  resources :estimates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :estimates do
    match '/scrape' to: 'estimates#scrape', via: :post, on: :collection
  end

  root to: 'estimates#index'

end
