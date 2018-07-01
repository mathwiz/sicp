    void check_expect(Object exp, Object expected) {
        System.out.println(
                String.format(
                        "%s: %s",
                        expected.toString().equals(exp.toString()) ? "passed" : "failed",
                        expected)
        );
    }
