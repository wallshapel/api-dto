class AuthorDTO
  attr_reader :id, :name

  def initialize(author)
    @id = author.id
    @name = author.name
  end
end