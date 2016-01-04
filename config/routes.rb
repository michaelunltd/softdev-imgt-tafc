Rails.application.routes.draw do
  get 'transactions/index'

  get 'transactions/show'

  get 'transactions/new'

  get 'transactions/create'

  get 'transactions/edit'

  get 'transactions/update'

  get 'transactions/destroy'

  get 'login' => 'sessions#new', as: 'login'

  post 'login' => 'sessions#create', as: 'check_login'

  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'employees' => 'users#employees', as: 'employees'

  get 'employees/:id' => 'users#show_employee', as: 'show_employee'

  get 'home' => 'users#index', as: 'home'

  # root 'users#index'
  root 'sessions#new'

  get 'users/:id/clients' => 'users#clients'

  resources :users

  get 'clients/assign'

  resources :clients

  get 'users/:id/change_password' => 'users#change_password', as: 'change_password'

  patch 'users/:id/change_password' => 'users#update_password'

  put 'users/:id/change_password' => 'users#update_password'

  # Hi! I'm anpeng and I'll put some references here. :D
  # get '/patients/:id', to: 'patients#show', as: 'patient'
  # <%= link_to 'Patient Record', patient_path(@patient) %>

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
