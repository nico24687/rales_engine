Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do 

      namespace :merchants do 
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/find',   to: 'search#show'
        get '/:id/revenue', to: 'revenue#index'
        get '/:id/favorite_customer', to: 'favorite_customer#index'
        get '/most_items', to: 'most_items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/revenue', to: "revenue_date#show"
        get '/:id/customers_with_pending_invoices', to: 'pending#index'
      end

      namespace :transactions do 
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/find',   to: 'search#show'
      end

      namespace :customers do 
        get '/find',   to: 'search#show'
        get '/random', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#index'

      end

      namespace :items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
        get '/:id/best_day', to: 'best_day#show'
        get "/most_items", to: 'most_items#index'
        get "/most_revenue", to: "most_revenue#index"
      end

      namespace :invoices do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
      end

      namespace :invoice_items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/random', to: 'search#show'
      end

      resources :items,     only: [:index, :show] do 
        resources :invoice_items, only: [:index], to: 'items/invoice_items#index'
        resources :merchant, only: [:index], to: 'items/merchant#index'
      end

      resources :invoices,     only: [:index, :show] do 
        resources :transactions, only: [:index], to: 'invoices/transactions#index'
        resources :invoice_items, only: [:index], to: 'invoices/invoice_items#index'
        resources :items, only: [:index], to: 'invoices/items#index'
        resources :customer, only: [:index], to: 'invoices/customer#index'
        resources :merchant, only: [:index], to: 'invoices/merchant#index'
      end

      resources :invoice_items,  only: [:index, :show] do
        resources :invoice, only: [:index], to: "invoice_items/invoice#index"
        resources :item, only: [:index], to: "invoice_items/item#index"
      end

      resources :merchants, only: [:index, :show] do
       resources :invoices, only: [:index], to: "merchants/invoices#index" 
       resources :items, only: [:index], to: "merchants/items#index"
      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], to: "customers/invoices#index"
        resources :transactions, only: [:index], to: "customers/transactions#index"
      end

      resources :transactions, only: [:index, :show] do
        resources :invoice, only: [:index], to: "transactions/invoice#index"
      end
    end
  end
end
     

    
      
  