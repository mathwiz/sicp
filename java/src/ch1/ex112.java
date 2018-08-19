package ch1;

public class ex112 {
    public static void main(String[] args) {
        System.out.println(pascal(6, 1));
        System.out.println(pascal(6, 2));
        System.out.println(pascal(6, 3));
        System.out.println(pascal(6, 4));
        System.out.println(pascal(6, 5));
        System.out.println(pascal(6, 6));
    }

    static int pascal(int r, int n) {
        return n == 1 || n == r ? 1 : pascal(r - 1, n - 1) + pascal(r - 1, n);
    }
}
