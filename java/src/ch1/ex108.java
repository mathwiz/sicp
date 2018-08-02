package ch1;

import java.util.function.Function;

public class ex108 {
    static class CubeRootFunction {
        static final double factor = 100000.0;

        double calc(double x) {
            return iter(1.0, x);
        }

        double iter(double guess, double x) {
            return is_good_enough(guess, x) ? guess : iter(improve(guess, x), x);
        }

        boolean is_good_enough(double guess, double x) {
            return Math.abs(cube(guess) - x) < (guess / factor);
        }

        double cube(double x) {
            return x * x * x;
        }

        double improve(double guess, double x) {
            return (2 * guess + x / (guess * guess)) / 3;
        }

        double average(double x, double y) {
            return (x + y) / 2.0;
        }
    }

    static class cbrt extends CubeRootFunction implements Function<Double, Double> {
        @Override
        public Double apply(Double x) {
            return calc(x);
        }
    }

    public static void main(String[] args) {
        final cbrt f = new cbrt();
        System.out.println(f.apply(64.0) + " vs. cubed\n" + f.cube(f.apply(64.0)));
        System.out.println(f.apply(27.0) + " vs. cubed\n" + f.cube(f.apply(27.0)));
        System.out.println(f.apply(0.027) + " vs. cubed\n" + f.cube(f.apply(0.027)));
    }
}
