p = function() { p() }

test = function(x, y) {
  return x == 0 ? 0 : y;
}

// Try
// test(0, p()) => java.lang.StackOverflowError

