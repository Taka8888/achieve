Rails.application.routes.draw do

  devise_for :users
  #get 'blogs' =>'blogs#index'
  resources :blogs, only:[:index, :new, :create, :edit, :update, :destroy]do
    collection do
      post :confirm
    end
  end

  #get 'contacts' =>'contacts#contact'
  resources :contacts, only:[:new, :create]do
    collection do
      post :confirm
    end
  end
  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
