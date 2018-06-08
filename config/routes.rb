Rails.application.routes.draw do
  resources :request_accesses
  resources :documents
  resources :users

  match 'users/:id/create_request' => 'users#create_request', via: [:patch, :put, :post], as: :users_create_request
  match 'users/:id/approve_request' => 'users#approve_request', via: [:patch, :put, :post], as: :users_approve_request
  match 'users/:id/deny_request' => 'users#deny_request', via: [:patch, :put, :post], as: :users_deny_request
  match 'users/:id/view_document' => 'users#view_document', via: [:get], as: :users_view_document

  root to: 'sessions#new'
  get    'login'   => 'sessions#new', :as => :loginpage
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'signup' => 'sessions#signup', :as => :signup
  post 'sessions/new_user' => 'sessions#new_user'

end
