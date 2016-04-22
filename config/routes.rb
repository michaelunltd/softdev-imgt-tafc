Rails.application.routes.draw do
  mount Judge::Engine => '/judge'

  get 'home' => 'home#index', as: 'home'

  # employee
  get 'employees' => 'users#employees', as: 'employees'
  get 'employees/:id' => 'users#show_employee', as: 'show_employee'

  #managers
  get 'managers' => 'users#managers', as: 'managers'
  get 'managers/:id' => 'users#show_manager', as: 'show_manager'


  #owners
  get 'owners' => 'users#owners', as: 'owners'
  get 'owners/:id' => 'users#show_owner', as: 'show_owner'


  # employee options
  get 'employees/:employee_id/new_client' => 'clients#new', as: 'employee_new_client'
  get 'employees/:employee_id/client/:id' => 'clients#show', as: 'show_through_employee'

  # root 'users#index'

  # logging and logging out
  root 'sessions#new'
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create', as: 'check_login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  # the various users
  resources :users

  # clients and their transactions
  resources :clients do
    resources :transactions do
      post 'pay' => 'transactions#pay', as: 'pay'
    end
  end

  # password_related
  get 'users/:id/change_password' => 'users#change_password', as: 'change_password'
  patch 'users/:id/change_password' => 'users#update_password'
  put 'users/:id/change_password' => 'users#update_password'

  post ':id/fees/new' => 'fees#create', as:'new_fee'

  get 'reports/services_report' => 'reports#services_report', as: "reports_services_report"

  get 'clients/:id/transactions/:transaction_id/edit/:provisional_receipts_id' => 'transactions#edit_for_modal', as: "edit_modal_provisional_receipts"
  patch 'clients/:id/transactions/:transaction_id/edit/:provisional_receipt_id' => 'provisional_receipts#update', as: "edit_provisional_receipts"

  get 'reports/accounts_receivable'

  get 'reports/employees_report'

  get 'reports/transactions_report'

  resources :reports

  resources :transactions, except: :new

  resources :fees

  resources :services

  resources :provisional_receipts, except: [:new, :create]
end
