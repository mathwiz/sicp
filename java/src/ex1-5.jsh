int p() { return p(); }

int test(int x, int y) {
    return x == 0 ? 0 : y;
}

// Try this
// test(0, p()) => java.lang.StackOverflowError
