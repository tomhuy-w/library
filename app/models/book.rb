# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :borrower_records, dependent: :destroy
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def can_borrow?
    quantity.positive?
  end
end
