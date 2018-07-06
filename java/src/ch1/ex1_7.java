package ch1;

import java.util.function.Function;

public class ex1_7 {
    static class SquareRootFunction {
        static final double factor = 100000.0;

        double calc(double x) {
            return sqrt_iter(1.0, x);
        }

        double sqrt_iter(double guess, double x) {
            return is_good_enough(guess, x) ? guess : sqrt_iter(improve(guess, x), x);
        }

        boolean is_good_enough(double guess, double x) {
            return Math.abs(square(guess) - x) < (guess / factor);
        }

        double square(double x) {
            return x * x;
        }

        double improve(double guess, double x) {
            return average(guess, x / guess);
        }

        double average(double x, double y) {
            return (x + y) / 2.0;
        }
    }

    static class sqrt extends SquareRootFunction implements Function<Double, Double> {
        @Override
        public Double apply(Double x) {
            return calc(x);
        }
    }

    public static void main(String[] args) {
        System.out.println(new sqrt().apply(0.02) + " vs. actual\n" + Math.sqrt(0.02));
        System.out.println(new sqrt().apply(0.0002) + " vs. actual\n" + Math.sqrt(0.0002));
    }
}
