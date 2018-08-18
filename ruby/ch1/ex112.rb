require 'test/unit'

module Ex112
  def pascal(r, n)
    case n
    when 1
      1
    when r
      1
    else
      pascal(r - 1, n - 1) + pascal(r - 1, n)
    end
  end
end

class Ex112Test < Test::Unit::TestCase
  include Ex112

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_row_5
    assert(pascal(5, 1) == 1)
    assert(pascal(5, 2) == 4)
    assert(pascal(5, 3) == 6)
    assert(pascal(5, 4) == 4)
    assert(pascal(5, 5) == 1)
  end
end