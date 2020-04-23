class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :destroy] #ログイン中のユーザーのみが指定アクションをできるようにする
  def index
  	@books = Book.all
    @user = User.find(current_user.id)
  	@book_new = Book.new
  	@book_new.user_id = current_user.id
  end

  def show
  	@book = Book.find(params[:id])
  	@user = User.find(@book.user_id)
  	@book_new = Book.new
  	@book_new.user_id = current_user.id
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def create
  	book_new = Book.new(book_params)
  	book_new.user_id = current_user.id
  	if book_new.save
  		redirect_to book_path(book_new.id), notice: "You have creatad book successfully."
    else
    	redirect_to books_path,flash: { error: book_new.errors.full_messages }
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end