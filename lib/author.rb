require './lib/book.rb'

class Author
  attr_reader :first_name, :last_name, :books

  def initialize(name)
    @first_name = name[:first_name]
    @last_name = name[:last_name]
    @books = []
  end

  def add_book(title, date)
    book = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: date})
    books << book
    return book
  end

end
