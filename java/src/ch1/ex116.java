package ch1;

public class ex116 {
    public static void main(String[] args) {
        System.out.println(expt(2, 0));
        System.out.println(expt(2, 4));
        System.out.println(expt(2, 9));
        System.out.println(expt(3, 4));
        System.out.println(expt(3, 5));
        System.out.println("done");
    }

    static int expt(int b, int p) {
        return expt_invariant(b, p, 1);
    }

    static int expt_invariant(int b, int p, int a) {
        if (p == 0) return a;
        if (even(p)) return expt_invariant(sq(b), p / 2, a);
        return expt_invariant(b, p - 1, a * b);
    }

    static int sq(int x) {
        return x * x;
    }

    static boolean even(int x) {
        return x % 2 == 0;
    }
}
