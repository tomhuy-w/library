# frozen_string_literal: true

class BorrowerRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
