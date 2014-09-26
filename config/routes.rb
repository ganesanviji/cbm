FurnitureSalesSystem::Application.routes.draw do
  
  get "wel/ganesan"
  get "welcome/index"
  get "home/index"
  
  devise_for :users
  resources :references #do
  resources :models
 # end

  resources :cbms #do
    resources :costs #do
      resources :cost_details
   # end
  #end

  resources :reports

devise_scope :user do
  root :to => 'devise/sessions#new'
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'references#index'

  # Example of regular route:
     post '/ref_search' => 'references#ref_search', as: :ref_search

     post '/mod_search' => 'references#mod_search', as: :mod_search

     post '/mod_des_search' => 'references#mod_des_search', as: :mod_des_search

     get '/model_search' => 'references#model_search', as: :model_search

     post '/advanced_search' => 'reports#advanced_search', as: :advanced_search

     post '/cbm_search' => 'cbms#cbm_search', as: :cbm_search

     #get  '/Search_Result' => 'reports#search_result', :as => :search_result

    # post '/:model_id/cbm_create' => 'cbms#create', as: :cbm_create

  # Example of named route that can be invoked with purchase_url(id: product.id)
    # put 'references/:reference_id/update/:id' => 'models#update', as: :model_update

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
