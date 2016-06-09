Rails.application.routes.draw do
  get 'static_pages/questions'

  get 'static_pages/news'

  get 'static_pages/contact'

  get 'admin' => 'admin#index'
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  get "sessions/create"
  get "sessions/destroy"

  resources :users
  
  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store', via: :all
  end
end