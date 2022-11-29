# frozen_string_literal: true

class BorrowerRecordsController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_borrower_record, only: %i[destroy return]
  before_action :authenticate_user!

  def index
    @borrower_records = current_user.borrower_records.includes(:book).where(returned_at: nil)
  end

  def return; end

  def create
    BookService.new(book: @book, user: current_user).borrow!
    redirect_to books_path, notice: 'borrowed successfully'
  rescue StandardError => e
    redirect_to books_path, alert: e.message
  end

  def destroy
    BookService.new(borrower_record: @borrower_record).return!
    redirect_to borrower_records_path, notice: 'Returned successfully'
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_borrower_record
    @borrower_record = current_user.borrower_records.find(params[:id] || params[:borrower_record_id])
  end
end
