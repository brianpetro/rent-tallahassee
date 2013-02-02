ClassifiedSite::Application.routes.draw do
  resources :sites


  resources :feed_entries


  resources :subscribers


  resources :classifieds


  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'classifieds#index'
  end
  root :to => "classifieds#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  match "/packages" => "home#index"
end
