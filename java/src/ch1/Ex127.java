package ch1;

import java.util.*;
import java.util.function.*;

public class Ex127 {
    public static void main(String[] args) {
        System.out.println(test_case(10));
        System.out.println(test_case(11));
        System.out.println(test_case(561));
        System.out.println(test_case(1105));
        System.out.println(test_case(1729));
        System.out.println(test_case(2465));
        System.out.println(test_case(2821));
        // This is too big???
        // System.out.println(test_case(6601));
        System.out.println(test_case(6603));

        System.out.println(carmichael2(2821));
        // Still overflows
        // System.out.println(carmichael2(6601));
        System.out.println(carmichael2(6603));
        System.out.println("done");
    }

    static String test_case(int n) {
        return String.format("%d \t Prime: %s \t Fast Prime: %s \t Carmichael: %s", 
                             n, prime(n), fast_prime(n), carmichael(n));
    }

    static long square(long n) {
        return n * n;
    }

    static boolean divides(long a, long b) {
        return 0 == b % a;
    }

    static long find_divisor(long n, long test) {
        if (square(test) > n)
            return n;
        else if (divides(test, n))
            return test;
        else
            return find_divisor(n, test+1);
    }

    static long smallest_divisor(long n) {
        return find_divisor(n, 2);
    }

    static boolean prime(int n) {
        return n == smallest_divisor(n);
    }

    static boolean fast_prime(int n) {
        return fast_prime(n, 20);
    }

    static boolean fast_prime(int n, int times) {
        if (times == 0)
            return true;
        else if (fermat_test(n))
            return fast_prime(n, times-1);
        else
            return false;
    }

    static boolean fermat_test(int n) {
        Function<Integer, Boolean> f = (Integer a) -> a == expmod(a, n, n);
        return f.apply(1 + random(n-1));
    }

    static boolean carmichael(int n) {
        final Function<Integer, Boolean> try_it = a -> a == expmod(a, n, n);
        final Function<Integer, Boolean> iter = new Function<Integer, Boolean>() {
            public Boolean apply(Integer x) {    
                return 
                (x == 0) ||
                try_it.apply(x) && 
                this.apply(x-1);
            }
        };
        return !prime(n) && iter.apply(n-1);
    }

    static boolean carmichael_iter(Function<Integer, Boolean> tryFn, int x) {
        return  (x == 0) ||
                tryFn.apply(x) && 
                carmichael_iter(tryFn, x-1);
    }

    static boolean carmichael2(int n) {
        final Function<Integer, Boolean> try_it = a -> a == expmod(a, n, n);
        return !prime(n) && carmichael_iter(try_it, n-1);
    }

    static int random(int limit) {
        return new Random().nextInt(limit);
    }

    static long expmod(long base, long exp, long m) {
        if (exp == 0) 
            return 1;
        else if (divides(2, exp))
            return square(expmod(base, exp/2, m)) % m;
        else
            return (base * expmod(base, exp-1, m)) % m;
    }
    
}
