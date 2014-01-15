ForCedric::Application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  match "/" => "static_pages#home_page"
  get "static_pages/getting_started"
  get "static_pages/start_project"
  get "static_pages/start_preview"
  get "static_pages/home_page"
  get "static_pages/browse"
  get "static_pages/about"
  get "static_pages/checklist"
  get "static_pages/project_page"
  get "static_pages/verify_account"
  get "static_pages/faq"
  get "static_pages/project_profile"
  get "static_pages/owner_info"
  get "static_pages/login"
  get "static_pages/profile_page"  

  get "static_pages/profile_settings" 

  # get 'registrants', to: 'static_pages#registrants', as: # 'registrants'

  get 'registrants', to: 'registrants#index', as: 'registrants'
  get 'dashboard', to: 'static_pages#dashboard', as: 'dashboard' 
  get 'projects', to: 'static_pages#projects', as: 'projects'
  get 'donations', to: 'static_pages#donations', as: 'donations'
  post 'preview', to: 'owner_infos#preview'
  
  resources :users
  
  resources :projects do
    collection do
      post 'account_verify'
      post 'save_country'
    end
    member do
      get 'checklist'
      get 'start_preview'
      get 'getting_started'
    end
    
    resources :owner_infos
    resources :account_verifies, :controller => "Accounts"
  end
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  # Sample of named route:
  match 'accounts/:token/verification' => 'accounts#verification', :as => :verification
  # This route can be invoked with purchase_url(:id => product.id)
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  # Sample resource route with options:
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
  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  root :to => 'static_pages#login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
