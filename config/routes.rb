Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
  end
  resources :gynecology_templates do
    resources :gynecology_annexes, except: [:index]
    resources :prescriptions, module: :gynecology_templates
    resources :template_photos, module: :gynecology_templates
    resources :template_files, module: :gynecology_templates
    
  end
  resources :doctors, only: [:show, :edit, :update, :destroy] 
  resources :template_plans
  resources :plans do
    collection do
      get :save_template_plan
      post :save_template_plan
    end
  end

   get '/add_template_plan', to: "plans#add_template_plan", :as => "add_template_plan"
  get '/admin_panel', to: "admins#admin_panel", :as => "admin_panel"
  get '/all_gynecologists', to: "admins#all_gynecologists", :as => "all_gynecologists"
  get '/all_ophthalmologists', to: "admins#all_ophthalmologists", :as => "all_ophthalmologists"
  get '/show_doctor', to: "admins#show_doctor", :as => "show_doctor"
end