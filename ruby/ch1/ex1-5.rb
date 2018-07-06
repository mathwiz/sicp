require 'test/unit'

def p()
  p()
end

def test(x, y)
  x == 0 ? 0 : y
end

class Ex5Test < Test::Unit::TestCase

  def test_infinite
    assert_equal(0, test(0, p()))
  end

end