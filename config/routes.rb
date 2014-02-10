Tandem::Application.routes.draw do
  authenticated :user do
    root :to => redirect("/users/tandem")
  end

 
  get "/" => redirect("/home/index")
  resources :appointments
  resources :user_steps

  resources :availables
  resources :coupons


  resources :languages

  resources :interests
  put "rooms/:id/close" => "rooms#close", :as => "close_room"

  put "users/update_language" => "users#update_language", :as => :update_language
  match "users/language" => "users#language", :as => :language_users
   match 'users/tandem' => 'users#tandem', :as => :tandem_users
   match 'users/find' => 'users#find', :as => :find_users
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get "home/index"

  #resource :users do
    ## Route GET /user/tandem
    #get 'tandem', :on => :collection
    #get 'practice', :on => :collection

  #end

  resources :users


   resources :rooms
   match '/party/:id', :to => "rooms#party", :as => :party, :via => :get
   match '/users/find', :to => "users#find", :as => :find_users, :via => :get

  # Sample resource route (maps HTTP verbs to controller actions automatically):
   #match '/users/edit/:id', :to => "users#edit", :as => :edit_user, :via => :get
    #resources :users, only: [:index ,:show, :edit, :update, :delete]
    #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
