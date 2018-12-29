package ch1;

public class ex113 {
    public static void main(String[] args) {
        System.out.println(fib(0) == 0);
        System.out.println(fib(1) == 1);
        System.out.println(fib(2) == 1);
        System.out.println(fib(3) == 2);
        System.out.println(fib(4) == 3);
        System.out.println(fib(5) == 5);
        System.out.println(fib(15) == 610);
        System.out.println("done");
    }

    static int fib(n) {
        if (n == 1 || n == 0) {
            return n;
        } else {
            return Math.round((Math.pow(psi, n) - Math.pow(phi, n)) / Math.sqrt(5));
        }
    }

    static psi = (1 + Math.sqrt(5)) / 2;
    static phi = (1 - Math.sqrt(5)) / 2;
}
