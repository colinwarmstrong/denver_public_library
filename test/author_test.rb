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

  def test_we_can_add_a_books_to_an_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal 0, charlotte_bronte.books.length
    assert_instance_of Book, charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal 1, charlotte_bronte.books.length
    assert_instance_of Book, charlotte_bronte.add_book("Villette", "1853")
    assert_equal 2, charlotte_bronte.books.length
  end

end
