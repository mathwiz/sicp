    interface Operator {
        int binary(int left, int right);
    }

        int a_plus_abs_b(int a, int b) {
            Operator op = b > 0 ? (x, y) -> x + y : (x, y) -> x - y;
            return op.binary(a, b);
        }

        check_expect(a_plus_abs_b(1, 2), 3);
        check_expect(a_plus_abs_b(1, -2), 3);
        check_expect(a_plus_abs_b(-1, 2), 1);
        check_expect(a_plus_abs_b(-1, -2), 1);
