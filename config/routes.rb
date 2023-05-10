Rails.application.routes.draw do
  
  namespace :admins do
    get 'rentals/update'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/update'
  end
  namespace :admins do
    get 'parkings/index'
    get 'parkings/show'
    get 'parkings/update'
  end
  namespace :admins do
    get 'homes/top'
  end
  root to: 'homes#top'
  get "search" => "searches#index"
  
  namespace :providers do
    
    resources :providers, only:[:edit, :update, :destroy] do
      collection do
        get 'my_page' => 'providers#show'
      end
      member do
        get 'quit'
      end
    end  
    resources :parkings, only:[:show, :new, :create, :edit, :update]
  end
  
  namespace :customers do
    resources :parkings, only:[:index, :show]
    resources :customers, only:[:edit, :update, :destroy] do
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
    end
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins,skip: [:passwords], controllers: {
    registrations: "admins/registrations",
    sessions: 'admins/sessions'
  }
  # レンタル顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords] ,controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
   # 提供顧客用
  # URL /customers/sign_in ...
  devise_for :providers, skip: [:passwords] ,controllers: {
    registrations: "providers/registrations",
    sessions: 'providers/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
