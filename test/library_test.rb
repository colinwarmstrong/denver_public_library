require './test/test_helper'

class LibraryTest < Minitest::Test

  def test_library_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end


end
