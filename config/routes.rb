Rails.application.routes.draw do


  get 'pages/home'

  get 'pages/about'

  controller :sessions do
	get 'login' => :new
	post 'login' => :create
	get 'logout' => :destroy
	delete 'logout' => :destroy
  end
  
  resources :items do
  put :purchase
  end
  
  resources :items do
  put :rate1
  end
  
  resources :items do
  put :rate2
  end
  
  resources :items do
  put :rate3
  end
  
  resources :items do
  put :rate4
  end
  
  resources :items do
  put :rate5
  end

  
  get 'pages/signedUp'
  
  get 'pages/myaccount'
  
  get 'pages/myitems'
  
  get 'pages/mypurchases'
  
  get 'pages/solditems'
  
  get 'search',	:to=>'items#search'
  
  get 'purchase', :to=>'items#purchase'
  
  get 'rate1', :to=>'ratings#rate1'
  
  get 'rate2', :to=>'ratings#rate2'
  
  get 'rate3', :to=>'ratings#rate3'
  
  get 'rate4', :to=>'ratings#rate4'
  
  get 'rate5', :to=>'ratings#rate5'

  resources :users
  resources :ratings
  resources :categories
  resources :items
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#home'

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
