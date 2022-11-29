# frozen_string_literal: true

class RenameColumnInBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :quntity, :quantity
  end
end
