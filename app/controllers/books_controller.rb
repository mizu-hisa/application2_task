class BooksController < ApplicationController

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to new_book_path
  end


  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end