Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  root 'home#index'

  resources :feedbacks, 
  only: [:new, :create]
  get '/feedbacks' => 'feedbacks#new'
  get 'places/new' => 'places#new'
  post 'places' => 'places#create'
  resources :places, only: [:index] do 
    resources :reports, only: [:new, :create]
  end
    get '/places/:place_id/reports' => 'reports#new'

  # get '/reports' => 'reports#new'
  get 'places/search' => 'places#search'

  post 'sessions/store_location' => 'sessions#store_location' 


  # mount Si  require 'sidekiq/web'dekiq::Web => '/sidekiq'
  # resources :listings do 
  #   resources :reservations
  # end

  # root 'home#index'

  # resources :users,
  # controller: 'users',
  # only: [:create, :new]

  # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
