package ch1;

import java.util.Date;

public class Ex122 {
    public static void main(String[] args) {
        System.out.println(runtime());
        searchForPrimes(1000, 1020);
        searchForPrimes(10000, 10040);
        searchForPrimes(100000, 100080);
        System.out.println("done");
    }

    public static boolean odd(int n) {
        return 1 == n % 2;
    }

    public static int square(int n) {
        return n * n;
    }

    public static boolean divides(int a, int b) {
        return 0 == b % a;
    }

    public static boolean prime(int n) {
        return new SmallestDivisor(n).value() == n;
    }

    public static long runtime() {
        return new Date().getTime();
    }

    public static void reportPrime(long elapsedTime) {
        System.out.print(" *** ");
        System.out.println(elapsedTime);;
    }

    public static void reportNonPrime() {
        //do nothing System.out.println("  ");
    }

    public static void startPrimeTest(int n, long startTime) {
        if (prime(n)) {
            reportPrime(runtime() - startTime);
        } else {
            reportNonPrime();
        }
    }

    public static void timedPrimeTest(int n) {
        System.out.println();
        System.out.print(n);
        startPrimeTest(n, runtime());
    }

    public static void searchForPrimes(int start, int end) {
        searchHelper(odd(start) ? start : ++start, end);
        System.out.println("finished");
    }

    public static void searchHelper(int n, int end) {
        if (n <= end) {
            timedPrimeTest(n);
            searchHelper(n+2, end);
        } else {
            System.out.println(" ");
        }
    }

    static class SmallestDivisor implements Value<Integer> {
        int n;
        SmallestDivisor(int number) {
            n = number;
        }

        @Override
        public Integer value() {
            return findDivisor(n, 2);
        }

        int findDivisor(int n, int test_divisor) {
            if (square(test_divisor) > n) {
                return n;
            } else if (divides(test_divisor, n)) {
                return test_divisor;
            } else {
                return findDivisor(n, test_divisor + 1);
            }
        }
    }
}
