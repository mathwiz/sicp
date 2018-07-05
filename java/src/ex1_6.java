import java.util.function.Function;

public class ex1_6 {
    static class SquareRootFunction {
        double calc(double x) {
            return sqrt_iter(1.0, x);
        }

        double sqrt_iter(double guess, double x) {
            return is_good_enough(guess, x) ? guess : sqrt_iter(improve(guess, x), x);
        }

        boolean is_good_enough(double guess, double x) {
            return Math.abs(square(guess) - x) < 0.000001;
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

    static class bad_sqrt extends sqrt {
        @Override
        double sqrt_iter(double guess, double x) {
            return new_if(is_good_enough(guess, x), guess, sqrt_iter(improve(guess, x), x));
        }

        double new_if(boolean predicate, double then_clause, double else_clause) {
            return predicate ? then_clause : else_clause;
        }
    }

    public static void main(String[] args) {
        System.out.println(new sqrt().apply(2.0));
        // this throws StackOverflowError
        //System.out.println(new bad_sqrt().apply(2.0));
    }
}
