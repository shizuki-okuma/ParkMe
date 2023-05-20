Rails.application.routes.draw do
  
  namespace :providers do
    get 'rental_prices/index'
  end
  root to: 'homes#top'
  get "search" => "searches#index"
  
  namespace :providers do
    get 'homes/providers_top' => 'homes#providers_top'
    resources :providers, only:[:edit, :update, :destroy] do
        get 'withdraw' => 'providers#withdraw'
      collection do
        get 'my_page' => 'providers#show'
      end
      member do
        get 'quit'
      end
    end  
    resources :parkings, only:[:show, :new, :create, :edit, :update]
    resources :rental_prices, only:[:index]
    
  end
  
  namespace :customers do
    get 'homes/customers_top' => 'homes#customers_top'
    resources :parkings, only:[:index, :show]
    resources :customers, only:[:edit, :update, :destroy] do
      get 'withdraw' => 'customers#withdraw'
    collection do
      get 'my_page' => 'customers#show'
    end
    
    member do
      get 'quit'
      end
    end
    
    resources :rentals, only:[ :index, :show, :new, :create] do
    collection do
      get 'thanks'
      post 'confirm'
    end
    
    member do
      post 'cancel'
      end
    end
  end
  
  namespace :admins do
    resources :rentals, only:[:index, :show, :update]
    resources :customers, only:[:index, :show, :update] do
      resource :statuses, only:[:create, :destroy]
    end
    resources :parkings, only:[:index, :show, :update] do
      resource :parking_statuses, only:[:create, :destroy]
    end
    resources :homes, only:[:top]
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins,skip: [:passwords], controllers: {
    registrations: "admins/registrations",
    sessions: 'admins/sessions'
  }
  # レンタル顧客用
  # URL /customers/sign_in ...
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
    devise_for :customers, skip: [:passwords] ,controllers: {
      registrations: "customers/registrations",
      sessions: 'customers/sessions'
    }
  end
   # 提供顧客用
  # URL /providers/sign_in ...
  devise_scope :customer do
    post 'providers/guest_sign_in', to: 'providers/sessions#guest_sign_in'
  devise_for :providers, skip: [:passwords] ,controllers: {
    registrations: "providers/registrations",
    sessions: 'providers/sessions'
  }
  end
end
