import java.util.Arrays;

    int sum_squares(int[] xs) {
        return Arrays.stream(xs).map(x -> x * x).sum();
    }

    int larger_sq(int x, int y, int z) {
        if (x <= y && x <= z) return sum_squares(new int[]{y, z});
        else if (y <= x && y <= z) return sum_squares(new int[]{x, z});
        else return sum_squares(new int[]{x, y});
    }

    check_expect(larger_sq(1, 2, 3), 13);
    check_expect(larger_sq(4, 2, 3), 25);
    check_expect(larger_sq(4, 5, 3), 41);
    check_expect(larger_sq(4, 2, 1), 20);