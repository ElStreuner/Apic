Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user_registrations" }
  # devise_for :users
  resources :products do
    resources :comments
 end
    resources :users

  post 'payments/create'

  get 'static_pages/thanks_payment' => 'thank_you'

  get 'payments/thanks'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'

root 'static_pages#landing_page'

mount ActionCable.server => '/cable'

resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end