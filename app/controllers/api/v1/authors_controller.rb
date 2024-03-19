# app/controllers/api/v1/authors_controller.rb

class Api::V1::AuthorsController < ApplicationController
  def index
    authors = Author.all
    render json: authors.map { |author| AuthorDTO.new(author) }
  end

  def show
    author = Author.find(params[:id])
    render json: AuthorDTO.new(author)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: AuthorDTO.new(author), status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    author = Author.find(params[:id])

    if author.update(author_params)
      render json: AuthorDTO.new(author)
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Author not found' }, status: :not_found
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
end
