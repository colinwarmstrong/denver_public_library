require './test/test_helper'
require './lib/book.rb'

class BookTest < Minitest::Test

  def test_book_exists
    book = Book.new

    assert_instance_of Book, book
  end



end
