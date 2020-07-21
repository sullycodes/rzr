Rails.application.routes.draw do
  
  resources :estimates do
    match '/scrape', to: 'estimates#scrape', via: :post, on: :collection
  end

  root to: 'estimates#index'

end
