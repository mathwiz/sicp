package ch1;

public class Ex123 {
    public static void main(String[] args) {
        System.out.println(new SmallestDivisor(199).value());
        System.out.println(new SmallestDivisor(1999).value());
        System.out.println(new SmallestDivisor(19999).value());
        System.out.println("done");
    }

    public static int square(int n) {
        return n * n;
    }

    public static boolean divides(int a, int b) {
        return 0 == b % a;
    }

    public static int next(int n) {
        return a == 2 ? 3 : n+2;
    }

    static class SmallestDivisor extends CachedValue<Integer> {
        int n;
        SmallestDivisor(int number) {
            n = number;
        }

        @Override
        public Value<Integer> compute() {
            val = findDivisor(n, 2);
            return this;
        }

        int findDivisor(int n, int test_divisor) {
            if (square(test_divisor) > n) {
                return n;
            } else if (divides(test_divisor, n)) {
                return test_divisor;
            } else {
                return findDivisor(n, next(test_divisor));
            }
        }
    }
}
