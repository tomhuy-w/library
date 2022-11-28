class BookService
  def initialize(book, user)
    @book = book
    @user = user
  end

  def borrow!
    # raise(StandardError, 'Book has no remaining quantity') unless @book.can_borrow?

    ActiveRecord::Base.transaction do
      BorrowerRecord.create!(user: @user, book: @book)
      @book.quantity -= 1
      @book.save!
    end
  end
end
