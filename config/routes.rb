Rails.application.routes.draw do
root to: 'static_pages#top'

get 'login', to: 'user_sessions#new'
post 'login', to: 'user_sessions#create'
delete 'logout', to: 'user_sessions#destroy'

resources :users, only: %i[new create]
resource :profile, only: %i[show edit update]
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true

    # /boards/bookmarksのURLを作っている。このURLのブックマークの一覧を表示する。
    collection do
      get 'bookmarks'
    end
  end
  # ブックマークのcreateアクションとdestroyアクション
  resources :bookmarks, only: %i[create destroy]
end
