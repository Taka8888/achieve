Rails.application.routes.draw do


  get 'notifications/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  #get 'blogs' =>'blogs#index'
  resources :blogs do
  resources :comments
  post :confirm, on: :collection
end
  #get 'contacts' =>'contacts#contact'
  resources :contacts, only:[:new, :create]do
    collection do
      post :confirm
    end
  end

   resources :users, only: [:index, :show]
   resources :relationships, only: [:create, :destroy]
  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :poems, only: [:index, :show]
end
