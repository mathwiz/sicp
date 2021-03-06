package ch1;

public class ex117 {
    public static void main(String[] args) {
        Times func = (int i, int i2) -> mult_invariant(i, i2);

        System.out.println(func.apply(9, 5));
        System.out.println(func.apply(9, 8));
        System.out.println(func.apply(9, 12));
        System.out.println(func.apply(9, 99));
        System.out.println("done");
    }

    @FunctionalInterface
    interface Times {
        int apply(int i, int i2);
    }

    static int mult_invariant(int a, int b) {
        if (b == 0) return 0;
        if (even(b)) return 2 * mult_invariant(a, b / 2);
        return a + mult_invariant(a, b - 1);
    }

    static boolean even(int x) {
        return x % 2 == 0;
    }
}
