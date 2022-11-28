# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :borrower_records, dependent: :destroy

  def can_borrow?
    quantity.positive?
  end
end
