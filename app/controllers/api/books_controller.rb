class Api::BooksController < ApplicationController
    def index
      books = Book.all 
      
      if books
        render json: {status: "SUCCESS", message: "Fetched all the books successfully", data: books}, status: :ok
      else
        render json: books.errors, status: :bad_request
      end
    end

    def create
      book = Book.new(book_params)
      
      if book.save
        render json: {status: "SUCCESS", message: "book was created successfully!", data: book}, status: :created
      else
        render json: book.errors, status: :unprocessable_entity
      end
    end

    def show
      book = Book.find(params[:id])
  
      if book
        render json: {data: book}, state: :ok
      else
        render json: {message: "book could not be found"}, status: :bad_request
      end
    end
  
    def destroy
      book = Book.find(params[:id])
  
      if book.destroy!
        render json: {message: "book was deleted successfully"}, status: :ok
      else
        render json: {message: "book does not exist"}, status: :bad_request
      end
    end
  
    def update
      book = Book.find(params[:id])
  
      if book.update!(book_params)
        render json: {message: "book was updated successfully", data: book}, status: :ok
      else
        render json: {message: "book cannot be updated"}, status: :unprocessable_entity
      end
    end
      
    private
      
    def book_params
      params.require(:book).permit(:title, :author, :publisher, :publish_date, :genre, :price, :user_id)
    end
end
