Rails.application.routes.draw do
  resources :rents
  resources :districts
  resources :types
  resources :feedbacks
  resources :favorite_parkings
  resources :reserve_parkings
  resources :rent_parkings
  resources :locations
  
  resources :type_parkings
  resources :profiles, only: [:edit, :update , :new]

  get      'trasaction/:id/list', controller: :trasaction, action: :list, as: :list
  get      'trasaction/:idparking/detail', controller: :trasaction, action: :detail, as: :detail
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'offert/create'

  get 'offert/list'

  get 'offert/reservation'
  
  get 'offert/confirmation'

  get 'trasaction/list'

  get 'trasaction/histori'

  get 'trasaction/favorite'

  get 'trasaction/detail'

  get 'trasaction/paiment'

  get 'trasaction/confirmation'

  get 'acceso/login'

  get 'acceso/userregister'

  get 'pages/index'

  get 'pages/information'

  get 'pages/question'

  get 'pages/conditional'

  get 'pages/contac'
  
  root 'rents#index'
  
  # Revisar lo que subio Walter, hay doble root
  #root 'home#index'
  
  get 'contact' => 'home#contacto'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  #match 'contacts', to: 'contacts#new', via: 'get'
  #resource "contacts", only: [:new, :create]

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
