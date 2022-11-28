# frozen_string_literal: true

json.extract! book, :id, :title, :author, :year, :edition, :publisher, :quantity, :created_at, :updated_at
json.url book_url(book, format: :json)
