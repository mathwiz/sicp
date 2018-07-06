def p : Int = { p }

def test (x: Int, y: Int) : Int = {
  if (x == 0) 0 else y
}

// Try this
// test (0, p) => [no response]
// Plus the definition gives this warning:
// ex1-5.scala:11: warning: method p does nothing other than call itself recursively
// def p : Int = { p }
