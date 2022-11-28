# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :borrower_records, dependent: :destroy
end
