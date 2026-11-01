Rails.application.routes.draw do
  get "board_nicknames/new"
  get "board_nicknames/create"
  root "boards#index"

  resources :boards, only: [:index, :new, :create, :show] do
  resource :nickname, only: [:new, :create], controller: "board_nicknames"
  end
end
