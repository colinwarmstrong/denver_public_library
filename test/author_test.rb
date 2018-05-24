require './test/test_helper'
require './lib/book.rb'
require './lib/author.rb'

class AuthorTest < Minitest::Test

  def test_authors_exits
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_authors_are_initialized_with_names_and_an_empty_book_array
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal 'Charlotte', charlotte_bronte.first_name
    assert_equal 'Bronte', charlotte_bronte.last_name
    assert_equal [], charlotte_bronte.books
  end

  def test_we_can_add_books_to_an_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Book, charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
  end
end
