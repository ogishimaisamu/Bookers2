class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	def top
	end
	def new
		@book = Book.new
	end
	def create
	  @book = Book.new(book_params)
	  @book.user_id = current_user.id
	  if @book.save
	  	flash[:notice] = "Book was successfully created"
	  	redirect_to book_path(@book)
	  else
	  	flash[:notice] = "error"
	  	redirect_to books_path
	 end

	def edit
	  @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        if @book.save
        flash[:notice] = "Book was successfully created"
        else
        flash[:notice] = "error"
        end
        redirect_to book_path(current_user)
	end
    end
	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end
	def show
        @book = Book.find(params[:id])
        @user = @book.user
	end

	def destroy
		@book =Book.find(params[:id])
		@book.destroy
		redirect_to books_path
    end
	private
	   def book_params
	   	   params.require(:book).permit(:title, :body)
	   end
	   def correct_user
	   	@book = Book.find(params[:id])
	   	if current_user == @book.user
	   	else redirect_to books_path
	   	end
	   end
end