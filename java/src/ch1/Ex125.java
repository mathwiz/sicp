package ch1;

import java.util.Date;
import java.util.Random;

public class Ex125 {
    public static void main(String[] args) {
        System.out.println(runtime());
        searchForPrimes(1000, 1020);
        searchForPrimes(10000, 10040);
        searchForPrimes(100000, 100080);
        System.out.println("done");
    }

    public static boolean odd(long n) {
        return !divides(2, n);
    }

    public static long square(long n) {
        return n * n;
    }

    public static boolean divides(long a, long b) {
        return 0 == b % a;
    }

    public static boolean prime(int n) {
        return fast_prime(n, 3);
    }

    public static boolean fast_prime(int n, int times) {
        if (times == 0)
            return true;
        else if (fermat_test(n))
            return fast_prime(n, times-1);
        else
            return false;
    }

    @FunctionalInterface
    interface TryFermat { boolean apply(long n); }

    public static boolean fermat_test(int n) {
        TryFermat f = (long a) -> a == new ExpMod(a, n, n).value();
        return f.apply(1 + random(n-1));
    }

    public static int random(int limit) {
        return new Random().nextInt(limit);
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

    static class ExpMod implements Value<Long> {
        long base;
        long exp;
        long m;
        ExpMod(long base, long exp, long m) {
            this.base = base;
            this.exp = exp;
            this.m = m;
        }

        @Override
        public Long value() {
            return calc(this.base, this.exp, this.m);
        }

        // This breaks the algo as in other languages
        long calc(long base, long exp, long m) {
            return fast_expt(base, exp) % m;
        }

        long fast_expt(long base, long exp) {
            if (exp == 0) {
                return 1;
            } else if (divides(2, exp)) {
                return fast_expt(base, exp/2);
            } else {
                return (base * fast_expt(base, exp-1));
            }
        }
    }
}
