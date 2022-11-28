# frozen_string_literal: true

json.extract! book, :id, :title, :author, :year, :edition, :publisher, :quntity, :created_at, :updated_at
json.url book_url(book, format: :json)
