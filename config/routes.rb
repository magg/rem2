Rem2::Application.routes.draw do
 
  controller :sessions do
   get 'login' => :new
   post 'login' => :create
   delete 'logout' => :destroy
  end
  
resources :password_resets

scope '(:locale)' do
namespace :admin do
  resources :stories
  resources :statuses
  resources :tasks
  resources :workdetails
  resources :students do
    collection do
      get :upload
      post :csv_import
    end
  end 
  resources :criterios
  resources :sprints
  resources :graphics
  resources :projects
  resources :teams do
    collection do
      get 'teamassign'
    end
    collection do
      post :assignmember
    end
  collection do
      post :unassignmember
    end
  end
  resources :usuarios
  resources :clients
  resources :admins

end

namespace :cliente do
  resources :stories
  resources :criterios
  resources :clients
end

namespace :alumno do
  resources :reports do
  collection do
    get 'productbacklog'
  end
  collection do
    get 'criterios'
  end
collection do
    get 'sprints'
  end
end
  resources :stories
  resources :students
  resources :tasks do
  collection do
    get 'taskasign'
  end
end
  resources :workdetails
  resources :criterios
  resources :sprints do
    collection do
        post :addsprint
    end
  end
  resources :sprintstories
end
end

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
