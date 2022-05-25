Rails.application.routes.draw do
root to: 'static_pages#top'

get 'login', to: 'user_sessions#new'
post 'login', to: 'user_sessions#create'
delete 'logout', to: 'user_sessions#destroy'

resources :users, only: %i[new create]
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true

    # /boards/bookmarksのURLを作っている。このURLのブックマークの一覧を表示する。
    collection do
      get 'bookmarks'
    end
  end
  # ブックマークのcreateアクションとdestroyアクション
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
  end

end
