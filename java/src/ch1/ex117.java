package ch1;

import java.util.function.BiFunction;

public class ex117 {
    public static void main(String[] args) {
        System.out.println(expt(2, 0));
        System.out.println(expt(2, 4));
        System.out.println(expt(2, 9));
        System.out.println(expt(3, 4));
        System.out.println(expt(3, 5));
        System.out.println(makeMult() .apply(9, 5));
        System.out.println(makeMult() .apply(13, 12));
        System.out.println("done");
    }

    static BiFunction<Integer, Integer, Integer> makeMult() {
        return new BiFunction<Integer, Integer, Integer>() {
            @Override
            public Integer apply(Integer integer, Integer integer2) {
                return multiply(integer, integer2);
            }

            private int multiply(int a, int b) {
                return b == 0 ? 0 : a + multiply(a, b - 1);
            }
        };
    }

    static int expt(int b, int p) {
        return expt_invariant(b, p, 1);
    }

    static int expt_invariant(int b, int p, int a) {
        if (p == 0) return a;
        if (even(p)) return expt_invariant(b * b, p / 2, a);
        return expt_invariant(b, p - 1, a * b);
    }

    static boolean even(int x) {
        return x % 2 == 0;
    }
}
