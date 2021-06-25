class BooksController < ApplicationController

  def create
    @books = Book.new(book_params)
    if @books.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
