Rails.application.routes.draw do
	#SESSIONS
	get "/" => "sessions#new"
	get 'sessions/new' => "sessions#new"
	get 'sessions/login' => "sessions#login"
	post "sessions" => "sessions#create"
	delete "sessions" => "sessions#destroy"
	#LENDERS
	get "lenders/:lender_id" => "lenders#index"
	post "lenders" => "lenders#create"
	patch "lenders/:lender_id" => 'lenders#update'
	#BORROWERS
	get 'borrowers/:borrower_id' => "borrowers#index"
	post "borrowers" => "borrowers#create"
	#LOANS
	post 'loans' => "loans#create"
	patch "loans/:loan_id" => "loans#update"
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
