class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def create
  end
  def new
    @user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  	@books = @user.books
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
        if @user.save
          flash[:notice] = "successfully created"
        else
          flash[:notice] = "error"
   end
  end
private
   def user_params
  	  params.require(:user).permit(:name, :introduction, :profile_image )
   end
   def correct_user
    @user = User.find(params[:id])
    if current_user == @user
    else redirect_to user_path(current_user)
    end
   end
end
