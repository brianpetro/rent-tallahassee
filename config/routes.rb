ClassifiedSite::Application.routes.draw do
	match "/users/current" => "users#owner"
	match "/sites/sitemap" => "sites#sitemap"
  resources :sites
  resources :feed_entries
  resources :subscribers
  resources :classifieds
	match "/users/nav" => "users#nav"
  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  constraints DomainConstraint.new('rent-tallahassee.com') do
  	root :to => 'sites#show#1'
  end
  constraints DomainConstraint.new('localhost') do
  	root :to => 'sites#show#3'
  end
  constraints DomainConstraint.new('findfrackingjobs.com') do
  	root :to => 'sites#show#2'
  end
  constraints DomainConstraint.new('rent-philadelphia.com') do
  	root :to => 'sites#show#3'
  end
  root :to => "sites#show"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  match "/packages" => "home#index"
end
