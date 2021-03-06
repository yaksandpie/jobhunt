Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }

  # jobs dashboard
  get  'jobs', to: 'jobs#index', as: 'jobs'

  # company
  get  'company', to: 'companies#index', as: 'company'
  get  'company/add', to: 'companies#add', as: 'company_add'
  get 'company/:id', to: 'companies#edit', as: 'company_edit'
  post 'company/save', to: 'companies#save'
  delete 'company/:id', to: 'companies#delete', as: 'company_delete'

  # positions
  get 'position/add', to: 'positions#add', as: 'position_add'
  get 'position/edit/:id', to: 'positions#edit', as: 'position_edit'
  get 'positions/applied_for/:position_id', to: 'positions#applied_for', as: 'position_applied_for'
  post 'position/save', to: 'positions#save'
  delete 'position/:id', to: 'positions#delete', as: 'position_delete'

  # interviews
  get  'interview', to: 'interviews#index', as: 'interview'
  get 'interview/edit/:id', to: 'interviews#edit', as: 'interview_edit'
  get 'interview/add', to: 'interviews#add', as: 'interview_add'
  post 'interview/save', to: 'interviews#save'
  delete 'interview/:id', to: 'interviews#delete', as: 'interview_delete'

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

  root to: 'pages#home'

  match '*path', to: 'pages#error404', via: [:get, :post]
end
