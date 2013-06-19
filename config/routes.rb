Nadsenci::Application.routes.draw do

  resources :links



  resources :verses

  resources :first_letters

  resources :songs

  resources :regions

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :kinds


  match '/alphabet',      to: 'alphabet#index'
  match '/alphabet/:let', to: 'alphabet#show', :as => :letter
  match 'report/:id', to: 'reports#index', :as => :report
 
  match '/signup',    to: 'users#new'
  match '/signin',    to: 'sessions#new'
  match '/signout',   to: 'sessions#destroy', via: :delete
  match '/map', to: 'map#index'
  match '/about', to: 'search#index', :as => :about
  
  get "map/index"

  get "users/new"
  get "regions/create"
  

  match "reports/check", to: 'reports#check', via: :put
  match "reports/destroy", to: 'reports#destroy', via: :delete
  match "editor/:id", to: 'users#unchecked', :as => :unchecked
  match "editor/:id/checked", to: 'users#checked', :as => :checked



  post "songs/add_kind"
  post "songs/add_region"
  post "users/add_favourite"
  post "users/remove_favourite"
  post "search/result"
  post "verses/create"
  post "regions/create"
  post "regions/search"
  post "kinds/search"
  post "reports/create"
  
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  root :to => 'map#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
