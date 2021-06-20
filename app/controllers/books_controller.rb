class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to "/show"
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def confirm
    @book = Book.new(book_params)
  end

  private
  def book_params
    # ストロングパラメータ入れたらmissing or emptyって出るから削除中
  end

end
