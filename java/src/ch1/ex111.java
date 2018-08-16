package ch1;

public class ex111 {
    public static void main(String[] args) {
        System.out.println(recursive(8));
        System.out.println(iterative(8));
    }

    static int recursive(int n) {
        return (n < 3) ? n : recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3);
    }

    static int single(int a, int b, int c) {
        return a + 2 * b + 3 * c;
    }

    static int helper(int a, int b, int c, int x) {
        return (x == 3) ? single(a, b, c) : helper(single(a, b, c), a, b, x - 1);
    }

    static int iterative(int n) {
        return (n < 3) ? n : helper(2, 1, 0, n);
    }
}
