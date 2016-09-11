Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  root 'home#index'

  # # Admin Routes

  # get '/admin/upload/assets(/:id)/:action_name', :to => 'admin/assets#asset_form', :action_name => /edit|new/, :as => 'asset_form'

  namespace :admin do
    resources :articles do
      get 'new_category', on: :collection
      post 'create_category', on: :collection
    end
    resources :assets
    resources :reports do
      get 'download'
      post 'download_file'
    end
  end

  resources :admin do
    get 'dashboard', on: :collection
    get 'reports', on: :collection
    get 'upload', on: :collection
    post 'save_asset', on: :collection
  end




  # # Site Routes

  # resources :home

  get '/our-services' => 'home#services', :as => 'services'
  get '/show-case' => 'home#show_case', :as => 'show_case'
  get '/history' => 'home#history', :as => 'history'
  get '/contact-us' => 'home#contact_us', :as => 'contact_us'
  get '/downloads' => 'home#downloads', :as => 'downloads'

  get '/download/:alias_name(/:access_code)' => "home#get_file"

  get '/login' => 'home#login', :as => 'login' #needs to be changed



  get 'blog/articles' => 'blog#list_blog', as: "list_blog_articles"
  get 'blog/articles/:article_alias_name' => 'blog#show_blog', as: "blog_article"
  get 'blog/categories/:category_alias_name' => 'blog#category_articles', as: "category_articles"
  get 'blog/tag/:tag_alias_name' => 'blog#tag_articles', as: "tag_articles"


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
end
