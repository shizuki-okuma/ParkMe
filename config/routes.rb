Rails.application.routes.draw do
  
  root to: 'homes#top'
  get "search" => "searches#index"
  
  scope module: :providers do
    
    resources :providers, only:[:edit, :update, :destroy] do
      collection do
        get 'my_page' => 'providers#show'
      end
      member do
        get 'quit'
      end
    end  
    resources :parkings, only:[:new, :create, :edit, :update, :show]
  end
  
  scope module: :customers do
    
    resources :customers, only:[:edit, :update, :destroy] do
    collection do
      get 'my_page' => 'customers#show'
    end
    
    member do
        get 'quit'
      end
    end
    
    resources :parkings, only:[:index, :show] 
    resources :rentals, only:[:index, :show, :new, :create, :thanks, :confirm] 
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
