require 'test/unit'

module Ex114
  def count_change(amount)
    cc(amount, 5)
  end

  def cc(amount, kinds_of_coins)
    if amount == 0
      1
    elsif amount < 0 || kinds_of_coins == 0
      0
    else
      cc(amount, kinds_of_coins - 1) +
          cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins)
    end
  end

  def biggest_denomination(kinds_of_coins)
    case kinds_of_coins
    when 1
      1
    when 2
      5
    when 3
      10
    when 4
      25
    when 5
      50
    end
  end
end

class MyTest < Test::Unit::TestCase
  include Ex114

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

  def test1
    assert(count_change(0) == 1)
    assert(count_change(1) == 1)
    assert(count_change(2) == 1)
    assert(count_change(11) == 4)
    assert(count_change(100) == 292)
  end
end