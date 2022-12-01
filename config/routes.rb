# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :borrower_records, only: [:index]
  resources :books, shallow: true do
    resources :borrower_records, only: %i[create destroy] do
      get 'return', to: 'borrower_records#return'
    end
  end
  root to: 'books#index'
end
