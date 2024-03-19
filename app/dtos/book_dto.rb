class BookDTO
  attr_reader :id, :name, :editorial, :year, :author

  def initialize(book)
    @id = book.id
    @name = book.name
    @editorial = book.editorial
    @year = book.year
  end
end