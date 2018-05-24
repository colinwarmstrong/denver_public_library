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

  def test_we_can_add_books_to_a_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    assert_equal [jane_eyre], dpl.books

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_equal [jane_eyre, mockingbird, villette], dpl.books
  end

  def test_we_can_find_if_library_has_a_specific_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert dpl.include?('To Kill a Mockingbird')
    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_if_the_library_can_produce_a_sorted_card_catalogue
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal [jane_eyre, villette, mockingbird], dpl.card_catalogue
  end

  def test_if_the_library_can_find_books_by_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    bronte_books = {"Jane Eyre" => jane_eyre, "Villette" => villette}
    lee_books = {"To Kill a Mockingbird" => mockingbird}

    assert_equal bronte_books, dpl.find_by_author("Charlotte Bronte")
    assert_equal lee_books, dpl.find_by_author("Harper Lee")
  end

  def test_if_the_library_can_find_books_by_publication_date
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    books_from_1847 = {'Jane Eyre' => jane_eyre}
    books_from_1853 = {'Villette' => villette}
    books_from_1960 = {'To Kill a Mockingbird' => mockingbird}

    assert_equal books_from_1847, dpl.find_by_publication_date('1847')
    assert_equal books_from_1853, dpl.find_by_publication_date('1853')
    assert_equal books_from_1960, dpl.find_by_publication_date('1960')
  end

end
