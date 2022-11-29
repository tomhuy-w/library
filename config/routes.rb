# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :borrower_records, only: [:index]
  resources :books, shallow: true do
    resources :borrower_records, only: [:create, :destroy]
  end
  root to: 'books#index'
end
