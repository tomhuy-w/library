class AddRatedToBorrowerRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :borrower_records, :rate, :integer
  end
end
