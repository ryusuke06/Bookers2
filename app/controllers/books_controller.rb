class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :destroy] #ログイン中のユーザーのみが指定アクションをできるようにする

  def show
  	@book = Book.find(params[:id])
  	@book_new = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
  	book = book(params[:id])
  	book.destroy
  	redirect_to book_path(book.id)
  end

  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
