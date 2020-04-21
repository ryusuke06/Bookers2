Rails.application.routes.draw do
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  #リダイレクト先変更のため、それぞれ指定したコントローラを経由するように指示
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :home, only: [:index, :about]
  get "home/about" => "home#about"

#indexは「/コントローラ名」をルーティングしてくれるよ！
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update]

end
