# frozen_string_literal: true

class BookService
  def initialize(book: nil, user: nil, borrower_record: nil)
    @book = book
    @user = user
    @borrower_record = borrower_record
  end

  def borrow!
    raise(StandardError, 'Book has no remaining quantity') unless @book.can_borrow?

    ActiveRecord::Base.transaction do
      BorrowerRecord.create!(user: @user, book: @book)
      @book.quantity -= 1
      @book.save!
    end
  end

  def return!
    ActiveRecord::Base.transaction do
      @borrower_record.update!(returned_at: Time.zone.now)
      book = @borrower_record.book
      book.quantity += 1
      book.save!
    end
  end
end
