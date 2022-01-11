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
        return String.format("%d \t Prime: %s \t Fast Prime: %s \t Miller-Rabin: %s", 
                             n, prime.apply((long)n), fast_prime.apply(n, 20), fast_miller_rabin.apply(n, 20));
    }

    static class Expmod {
        final long b, e, m;
        Expmod(long base, long exp, long modulus) {
            b = base; e = exp; m = modulus;
        }    

        long value() {
            if (e == 0) 
                return 1;
            else if (divides.apply(2L, e))
                return square.apply(new Expmod(b, e/2, m).value()) % m;
            else
                return (b * (new Expmod(b, e-1, m).value())) % m;
        }    
    }

    static class MillerRabinExpmod extends Expmod {
        MillerRabinExpmod(long base, long exp, long modulus) {
            super(base, exp, modulus);
        }    

        long nontrivial_square_root(long x, long sq) {
            boolean result = sq == 1L && x != 1L && x != (m-1);
            return result ? 0L : sq;
        }    

        long squaremod_with_check(long n) {
            return nontrivial_square_root(n, square.apply(n) % m);
        }    

        long value() {
            if (e == 0)
                return 1;
            else if (divides.apply(2L, e))
                return squaremod_with_check(new MillerRabinExpmod(b, e/2, m).value());
            else
                return (base * (new MillerRabinExpmod(b, e-1, m).value())) % m;
        }    
    }    

    static BiFunction<Integer, Integer, Boolean> fast_miller_rabin;
    static {
        fast_miller_rabin = (n, times) ->
        times == 0 ||
        (miller_rabin_test(n) && fast_miller_rabin.apply(n, times-1));
    }    

    static boolean miller_rabin_test(int n) {
        Function<Integer, Boolean> f = a -> 1 == new MillerRabinExpmod(a, n-1, n).value();
        return f.apply(1 + random.apply(n-1));
    }

    static BiFunction<Integer, Integer, Boolean> fast_prime;
    static {
        fast_prime = (n, times) ->
        times == 0 ||
        (fermat_test(n) && fast_prime.apply(n, times-1));
    }    

    static boolean fermat_test(int n) {
        Function<Integer, Boolean> f = a -> a == new Expmod(a, n, n).value();
        return f.apply(1 + random.apply(n-1));
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
}
