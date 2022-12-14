# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#rate' do
    context 'when the book has 4 review rates which are 5, 4, 3, 2' do
      let(:book) { create(:book) }
      let(:user) { create(:user) }

      before do
        (2..5).each do |i|
          create(:borrower_record, book_id: book.id, user_id: user.id, rate: i)
        end
      end

      it 'expect to get 3.5' do
        expect(book.rate).to eq(3.5)
      end
    end
  end
end
