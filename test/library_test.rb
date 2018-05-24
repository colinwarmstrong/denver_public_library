require './test/test_helper'

class LibraryTest < Minitest::Test

  def test_library_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end

  def test_library_starts_with_an_empty_books_array
    dpl = Library.new

    assert_equal [], dpl.books
  end


end
