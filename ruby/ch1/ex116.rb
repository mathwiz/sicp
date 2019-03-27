require 'test/unit'

module Ex116
  class Expt

  end

  def sq(x)
    x * x
  end

  def p(x)
    3 * x - 4 * cube(x)
  end

  def sine(angle)
    if angle.abs < 0.1
      angle
    else
      p(sine(angle / 3.0))
    end
  end
end

class MyTest < Test::Unit::TestCase
  include Ex116

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @tester = Expt.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test1
    assert(sine(0) == 0)
    assert(sine(1) > 0.84)
    assert(sine(2) < 0.91)
    assert(sine(3) < 0.15)
  end
end