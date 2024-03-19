# app/controllers/api/v1/books_controller.rb

class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: books.map { |book| BookDTO.new(book) }
  end

  def show
    book = Book.find(params[:id])
    render json: BookDTO.new(book)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: BookDTO.new(book), status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      render json: BookDTO.new(book)
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  # def details
  #   book = Book.find(params[:id])
  #   render json: book_author_names(book)
  # rescue ActiveRecord::RecordNotFound
  #   render json: { error: 'Book not found' }, status: :not_found
  # end

  def details
    book = Book.find(params[:id])
    render json: BookDetailsDTO.new(book)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  private

  def book_params
    params.require(:book).permit(:name, :editorial, :year, :author_id)
  end

  # def book_author_names(book)
  #   {
  #     book_name: book.name,
  #     author_name: book.author.name
  #   }
  # end
end
