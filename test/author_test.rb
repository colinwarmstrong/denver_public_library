require './test/test_helper'
require './lib/author.rb'

class AuthorTest < Minitest::Test

  def test_authors_exits
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, author
  end

  def test_authors_are_initialized_with_names_and_an_empty_book_array
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal 'Charlotte', author.first_name
    assert_equal 'Bronte', author.last_name
    assert_equal [], author.books
  end

end
