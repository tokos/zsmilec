RailsinstallerDemo::Application.routes.draw do

  # **************
  # ADMIN section
  # **************

  resources :hours      
  
  match 'hours?' => 'hours#index'
  
  match 'hours/select_timetable' => 'hours#select_timetable'  

  resources :days
  
  match 'days?' => 'days#index'
  
  match 'days/select_timetable' => 'days#select_timetable'

  resources :councils

  resources :timetables
  
  match 'admin/timetables/import' => 'timetables#import'

  resources :employees

  resources :events

  resources :schools
  
  resources :admin
  
  resources :pupils

  resources :subjects
  
  resources :parents
  
  resources :tasks
  
  resources :results
  
  # **************************************************************
  # NORMAL VIEWS
  # **************************************************************
  #resources :normal
  
  match 'normal' => 'n_school#index'
  
  # school
  
  match 'n_school' => 'n_school#index'
  
  match 'normal/school' => 'n_school#index'
  
  match 'n_school/contact' => 'n_school#contact'
  
  match 'n_school/history' => 'n_school#history'
  
  match 'n_school/map' => 'n_school#map'
  
  match 'map' => 'n_school#map'
  
  match 'history' => 'n_school#history'
  
  match 'contact' => 'n_school#contact'
  
  # employees  
  
  resources :n_employees
  
  match 'n_employees' => 'n_employees#index'
  
  match 'show_employee' => 'n_employees#show_employee'
  
  resources :n_timetable
  
  match 'n_timetable' => 'n_timetable#index'
  
  match 'show' => 'n_timetable#show'
  
  #match 'n_employees/show?' => 'n_employees#show'
  
  # events / actions
  
  match 'n_actions' => 'n_actions#index'


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
