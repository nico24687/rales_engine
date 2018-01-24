Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do 

      namespace :merchants do 
        get '/find_all', to: 'search#index'
        get '/random', to: 'search#show'
        get '/find',   to: 'search#show'
        get '/:id/revenue', to: 'reports#revenue'
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
      end

      namespace :items do
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
        
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]

    end
  end


end
     

    
      
  