Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'sessions'
             }

  resources :documents, only: [:index, :show]
  resources :folders, only: [:index, :show]

  namespace :admin do
    resources :documents, except: [:index, :show]
    resources :folders, except: [:index, :show]
  end
end
