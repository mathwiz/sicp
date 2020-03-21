package ch1;

public class ex120 {
    public static void main(String[] args) {
        Fun f = (int i, int j) -> gcd(i, j);

        System.out.println(f.apply(1, 1) == 1);
        System.out.println(f.apply(206, 40) == 2);
        System.out.println(f.apply(60, 45) == 15);
        System.out.println(f.apply(24, 12) == 12);
        System.out.println("done");
    }

    @FunctionalInterface
    interface Fun {
        int apply(int a, int b);
    }

    static int gcd(int a, int b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }

}
