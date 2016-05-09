Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors, controllers: {registrations: "doctors/registrations"} 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'start#index'
 
  resources :doctors, only: [:show]

  get "autocomplete_patient_name", controller: "application"

  resources :patients, only: [:show]
  resources :invoices
  get 'search_patient'  => 'application#search_patient'
  post 'search_patient'  => 'application#search_patient'

  # get 'search_patient'  => 'gynecology_templates#search_patient'
  # post 'search_patient'  => 'gynecology_templates#search_patient'


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

  resources :ophtalmology_templates do
    resources :prescriptions, module: :ophtalmology_templates
    resources :template_photos, module: :ophtalmology_templates
    resources :template_files, module: :ophtalmology_templates
    resources :patients, module: :ophtalmology_templates
  end

  resources :general_templates do
    resources :general_annexes, except: [:index]
    resources :prescriptions, module: :general_templates
    resources :template_photos, module: :general_templates
    resources :template_files, module: :general_templates
    resources :patients, module: :general_templates
  end
  resources :gynecology_templates do
    resources :gynecology_annexes, except: [:index]
    resources :prescriptions, module: :gynecology_templates
    resources :template_photos, module: :gynecology_templates
    resources :template_files, module: :gynecology_templates
    resources :patients, module: :gynecology_templates
    resources :pregnancy_evolutions, except: [:index]
    resources :pregnancy_notes, except: [:index]
    
  end

  resources :doctors, only: [:show, :edit, :update, :destroy]
  resources :template_plans
  resources :plans, only: [:show] do
    collection do
      get :save_template_plan
      post :save_template_plan
    end
  end

  resources :payments, except: [:index, :show, :edit, :update, :destroy, :new, :create] do
    collection do
      get :accept
      put :accept
      get :cancel
      put :cancel
    end
  end
  get '/add_template_plan', to: "plans#add_template_plan", :as => "add_template_plan"
  get '/doctor_plan', to: "plans#doctor_plan", :as => "doctor_plan"
  get '/template_plan_history', to: "plans#template_plan_history", :as => "template_plan_history"

  get '/doctor_payment_panel', to: "doctors#doctor_payment_panel", :as => "doctor_payment_panel"
  get '/doctor_panel', to: "doctors#panel", :as => "doctor_panel"
  
  get '/admin_panel', to: "admins#admin_panel", :as => "admin_panel"
  get '/admin_templates_panel', to: "admins#admin_templates_panel", :as => "admin_templates_panel"
  get '/overdue_template_plans', to: "admins#overdue_template_plans", :as => "overdue_template_plans"
  get '/all_gynecologists', to: "admins#all_gynecologists", :as => "all_gynecologists"
  get '/all_ophthalmologists', to: "admins#all_ophthalmologists", :as => "all_ophthalmologists"
  get '/show_doctor', to: "admins#show_doctor", :as => "show_doctor"
  get '/show_invoice_data', to: "admins#show_invoice_data", :as => "show_invoice_data"

  resources :start, only: [:index]

end