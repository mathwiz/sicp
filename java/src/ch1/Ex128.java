package ch1;

import java.util.*;
import java.util.function.*;

public class Ex128 {
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
    }

    static String test_case(int n) {
        return String.format("%d \t Prime: %s \t Fast Prime: %s \t Carmichael: %s", 
                             n, prime.apply((long)n), fast_prime.apply((long)n, 20), carmichael(n));
    }

    static long expmod(long base, long exp, long m) {
        if (exp == 0) 
            return 1;
        else if (divides.apply(2L, exp))
            return square.apply(expmod(base, exp/2, m)) % m;
        else
            return (base * expmod(base, exp-1, m)) % m;
    }

    static Function<Integer, Integer> random = limit -> 
        new Random().nextInt(limit);

    static Function<Long, Long> square = n -> 
        n * n;

    static BiFunction<Long, Long, Boolean> divides = (a, b) -> 
        0 == b % a;

    static BiFunction<Long, Long, Long> find_divisor;
    static {
        find_divisor = (n, test) ->
        square.apply(test) > n ? 
        n : 
        divides.apply(test, n) ? test : find_divisor.apply(n, test+1);
    }

    static Function<Long, Long> smallest_divisor = n -> 
        find_divisor.apply(n, 2L);

    static Function<Long, Boolean> prime = n ->
        n == smallest_divisor.apply(n);

    static BiFunction<Long, Integer, Boolean> fast_prime;
    static {
        fast_prime = (n, times) ->
        times == 0 ||
        (fermat_test.apply((int)n) && fast_prime.apply(n, times-1));
    }    

    static boolean fast_prime(int n, int times) {
        if (times == 0)
            return true;
        else if (fermat_test(n))
            return fast_prime(n, times-1);
        else
            return false;
    }

    static Function<Integer, Boolean> fermat_test;
    static {
        fermat_test = n ->
        expmod((1 + random.apply(n-1)), n, n);
    }
    static boolean fermat_test(int n) {
        Function<Integer, Boolean> f = (Integer a) -> a == expmod(a, n, n);
        return f.apply(1 + random.apply(n-1));
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
        return !prime.apply((long)n) && iter.apply(n-1);
    }

}
