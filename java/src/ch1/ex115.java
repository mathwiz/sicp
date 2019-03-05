package ch1;

public class ex115 {
    public static void main(String[] args) {
        System.out.println(sine(0));
        System.out.println(sine(1));
        System.out.println(sine(2));
        System.out.println(sine(3));
        System.out.println(sine(Math.PI / 6));
        System.out.println("done");
    }

    static double p(double x) {
        return 3 * x - 4 * cube(x);
    }

    static double sine(double angle) {
        if (Math.abs(angle) < 0.1) return angle;
        return p(sine(angle / 3.0));
    }

    static double cube(double x) {
        return x * x * x;
    }
}
