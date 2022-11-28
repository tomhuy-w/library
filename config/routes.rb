# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :books do
    member do
      resources :borrower_records, shallow: true, only: [:create]
    end
  end
  root to: 'books#index'
end
