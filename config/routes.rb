HomePage::Application.routes.draw do
  root :to => 'landing#index'
  # match 'code' => 'code#index'
  # match 'music' => 'music#index'
  # match 'photos' => 'photos#index'
  # resources :posts do

  # end
  # match 'blog/', :to => 'posts#index'
  # match 'blog/admin', :to => 'posts#admin'
  # match 'blog/new', :to => 'posts#new'
  # match 'blog/edit/:id', :to => 'posts#edit'
  # post 'blog/preview', :to => 'posts#preview'
  # put 'blog/preview', :to => 'posts#preview'
  # get 'blog/:slug', :to => 'posts#show', :as => 'post'
  # delete 'blog/:slug', :to => 'posts#destroy', :as  => 'post'
  # put 'blog/:slug', :to => 'posts#update', :as  => 'post'

  match "*a" => "application#render_404"
end
