class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date_full

  def initialize(book_info)
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @title = book_info[:title]
    @publication_date_full = book_info[:publication_date]
  end

  def publication_date
    @publication_date_full[-4..-1]
  end

end
