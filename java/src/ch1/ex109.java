package ch1;

public class ex109 {
    public static void main(String[] args) {
        System.out.println(plus_r(3,6));
        System.out.println(plus_it(3,6));
    }

    static int inc(int x) { return x + 1; }

    static int dec(int x) { return x - 1; }

    static int plus_r(int a, int b) { return a == 0 ? b : inc(plus_r(dec(a), b)); }

    static int plus_it(int a, int b) { return a == 0 ? b : plus_it(dec(a), inc(b)); }
}
