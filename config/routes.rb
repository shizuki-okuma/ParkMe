Rails.application.routes.draw do
  
  namespace :customers do
    get 'parkings/show'
    get 'parkings/index'
  end
  namespace :providers do
    get 'parkings/new'
    get 'parkings/create'
    get 'parkings/edit'
    get 'parkings/update'
  end
  namespace :providers do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/quit'
    get 'customers/destroy'
  end
  
  namespace :customers do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/quit'
    get 'customers/destroy'
  end
  
  get '/'=>'homes#top'
  
  
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
