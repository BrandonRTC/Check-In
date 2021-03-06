Rails.application.routes.draw do

  # change this or add a redirect to user homepage if logged in
  root to: "sessions#new"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do 
    resources :check_ins, only: [:new]
    resources :tours, only: [:new]
    # should that ^ actually be create?
  end

  resources :houses, only: [:index]

  resources :tours do 
    resources :check_ins, only: [:new, :create]    
    # possibly write current_tour method to replace nested create
  end

  resources :check_ins, only: [:index, :destroy]

  resources :check_ins do 
    post :report, on: :collection
  end

  #API ROUTES

  namespace :api, defaults: {format: :json} do
    resources :tours, only: [:index] do  
      resources :check_ins, only: [:new, :create]
    end
    resources :tours
  end
  
  #-------------------------------------------
  #-------------------------------------------
  #-------------------------------------------

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
