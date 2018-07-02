# Until we are able to load test/unit
class TempTestCase
  def initialize(name)
    @name = name
  end

  def assert_equal(expected, actual)
    p "failed #{expected}" unless expected == actual
  end
end


def sum_squares(xs)
  xs.reduce(0) {|a,x| a + x*x }
end