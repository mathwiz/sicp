package ch1;

public class ex119 {
    public static void main(String[] args) {
        Fun f = (int i) -> fib_iter(1, 0, 0, 1, i);

        System.out.println(f.apply(0) == 0);
        System.out.println(f.apply(1) == 1);
        System.out.println(f.apply(2) == 1);
        System.out.println(f.apply(3) == 2);
        System.out.println(f.apply(4) == 3);
        System.out.println(f.apply(5) == 5);
        System.out.println(f.apply(6) == 8);
        System.out.println(f.apply(15) == 610);
        System.out.println("done");
    }

    @FunctionalInterface
    interface Fun {
        int apply(int i);
    }

    static int fib_iter(int a, int b, int p, int q, int count) {
        if (count == 0) return b;
        if (even(count)) return fib_iter(a, b, p*p + q*q, q*q + 2*p*q, count / 2);
        return fib_iter(b*q + a*q + a*p, b*p + a*q, p, q, count - 1);
    }

    static boolean even(int x) {
        return x % 2 == 0;
    }
}
