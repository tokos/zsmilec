RailsinstallerDemo::Application.routes.draw do

  # **************
  # HOME
  # **************
  
  root :to => 'n_school#index'

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
  
  resources :holidays  
  
  resources :albums    
  
  resources :photos
  
  match 'photos/new/:id' => 'photos#new'
  
  match 'logs' => 'logs#index'
  
  match 'logs/index' => 'logs#index'
  
  match 'logs/parse' => 'logs#parse'
  
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
  
  match 'n_school/teaching' => 'n_school#teaching'
  
  match 'n_school/introduction' => 'n_school#introduction'
  
  match 'map' => 'n_school#map'
  
  match 'history' => 'n_school#history'
  
  match 'contact' => 'n_school#contact'
  
  match 'teaching' => 'n_school#teaching'
  
  match 'intoduction' => 'n_school#introduction'
  
  # employees  
  
  #resources :n_employees
  
  #match 'n_employees' => 'n_employees#index'
  
  #match 'show_employee' => 'n_employees#show_employee'
  
  match 'n_school_council' => 'n_school_council#index'    
  
  resources :n_timetable
  
  match 'n_timetable' => 'n_timetable#index'
  
  match 'show' => 'n_timetable#show'
  
  #match 'n_employees/show?' => 'n_employees#show'
  
  # events / actions
  
  match 'n_actions' => 'n_actions#index'
  
  match 'n_actions/action' => 'n_actions#action'
  
  match 'n_actions/holiday' => 'n_actions#holiday'
  
  match 'action' => 'n_actions#action'
  
  match 'holiday' => 'n_actions#holiday' 
  
  match 'calendar' => 'n_actions#calendar' 
  
  match 'n_actions/calendar' => 'n_actions#calendar'    
  
  match 'week_back' => 'n_actions#week_back' 
  
  match 'n_actions/week_back' => 'n_actions#week_back'
  
  match 'week_forward' => 'n_actions#week_forward' 
  
  match 'n_actions/week_forward' => 'n_actions#week_forward'
  
  match 'go_to_date' => 'n_actions#go_to_date' 
  
  match 'n_actions/go_to_date' => 'n_actions#go_to_date'
  
  match 'n_actions/event_info' => 'n_actions#event_info'   
  
  # documents
  
  match 'n_documents' => 'n_documents#index'
  
  match 'assets/documents/SVP.doc' => 'n_documents#show'
  
  # rooms
  
  match 'n_rooms' => 'n_rooms#index'
  
  match 'n_rooms/ict' => 'n_rooms#ict'
  
  match 'n_rooms/classroom' => 'n_rooms#classroom'
  
  # parents
  
  match 'n_parents' => 'n_parents#index'
  
  # pupils
  
  match 'n_pupils' => 'n_pupils#index'
  
  # fotos
  
  match 'n_foto' => 'n_foto#index'
  
  match 'n_foto/show/:id' => 'n_foto#show'
  
  match 'n_foto/show_big/:id' => 'n_foto#show_big'
  
  # newspapers
  
  match 'n_newspapers' => 'n_newspapers#index'
       
  match 'n_newspapers/show/:picture' => 'n_newspapers#show' 
  
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
