# frozen_string_literal: true
require 'elasticsearch/model'

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :borrower_records, dependent: :destroy
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def can_borrow?
    quantity.positive?
  end

  def rate
    borrower_records.where.not(rate: nil).average(:rate)
  end
end
