class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    @books.any? do |book|
      book.title == book_title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author)
    books_by_author = {}
    @books.each do |book|
      author_full_name = book.author_first_name + ' ' + book.author_last_name
      if author_full_name == author
        books_by_author[book.title] = book
      end
    end
    return books_by_author
  end

  def find_by_publication_date(date)
    books_by_date = {}
    @books.each do |book|
      if book.publication_date == date
        books_by_date[book.title] = book
      end
    end
    return books_by_date
  end

end
