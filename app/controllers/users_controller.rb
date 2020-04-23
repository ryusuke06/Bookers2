class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books #user.idとbook.user_idが紐づいていて。現在のuser_idからデータが全て持ってこれる
  	@book_new = Book.new
  end

  def index
  	@users = User.all
  	@user = User.find(current_user.id)
  	@books_all = Book.all
 	@book_new = Book.new
  	@book_new.user_id = current_user.id
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notices: "You have updated user successfully."
  	else
  	  render :edit
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
