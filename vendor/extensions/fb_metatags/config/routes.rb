Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :fb_metatags do
    resources :fb_metatags, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :fb_metatags, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :fb_metatags, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
