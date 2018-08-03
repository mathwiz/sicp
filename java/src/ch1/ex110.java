package ch1;

public class ex110 {
    public static void main(String[] args) {
        System.out.println("f(4) = " + f(4));
        System.out.println("g(4) = " + g(4));
        System.out.println("h(4) = " + h(4));
    }

    static int A(int x, int y) {
        if (y == 0) return 0;
        else if (x == 0) return 2 * y;
        else if (y == 1) return 2;
        else return A(x - 1, A(x, y - 1));
    }

    static int f(int n) {
        return A(0, n);
    }


    static int g(int n) {
        return A(1, n);
    }


    static int h(int n) {
        return A(2, n);
    }


    static int k(int n) {
        return 5 * n * n;
    }

}
