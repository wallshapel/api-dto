# app/dtos/book_details_dto.rb

class BookDetailsDTO
  attr_reader :name, :author_name

  def initialize(book)
    @name = book.name
    @author_name = book.author.name
  end
end
