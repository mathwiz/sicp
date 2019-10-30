package ch1;

public class ex117 {
    public static void main(String[] args) {
        Times func = (int i, int i2) -> mult_invariant(i, i2, 0);

        System.out.println(func.apply(9, 5));
        System.out.println(func.apply(9, 8));
        System.out.println(func.apply(9, 12));
        System.out.println(func.apply(9, 100));
        System.out.println("done");
    }

    @FunctionalInterface
    interface Times {
        int apply(int i, int i2);
    }

    static int mult_invariant(int b, int p, int a) {
        if (p == 0) return a;
        if (even(p)) return mult_invariant(b * 2, p / 2, a);
        return mult_invariant(b, p - 1, a + b);
    }

    static boolean even(int x) {
        return x % 2 == 0;
    }
}
