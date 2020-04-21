class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:edit] #後で検証　ログイン中のユーザーのみがアクションをできるようにする
  def show
  	@user = User.find(params[:id])
  	@book = @user.book(book.user_id)
  	@book_new = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
