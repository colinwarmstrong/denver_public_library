require './test/test_helper'
require './lib/author.rb'

class AuthorTest < Minitest::Test

  def test_authors_exits
    author = Author.new

    assert_instance_of Author, author
  end

end
