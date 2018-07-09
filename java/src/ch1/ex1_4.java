package ch1;

import java.util.Arrays;
import java.util.function.BiFunction;
import java.util.function.Supplier;

public class ex1_4 {
    static int add(int x, int y) {
        return x + y;
    }

    static int sub(int x, int y) {
        return x - y;
    }

    static class a_plus_abs_b {
        Supplier<Integer> op;

        a_plus_abs_b(int a, int b) {
            op = b > 0 ? () -> a + b : () -> a - b;
        }

        public Integer apply() {
            return op.get();
        }
    }


    static class a_plus_abs_b_function_literal implements BiFunction<Integer, Integer, Integer> {
        public Integer apply(Integer a, Integer b) {
            return Arrays.asList(b).stream()
                    .reduce(a, b > 0 ? ex1_4::add : ex1_4::sub);
        }
    }

    static int a_plus_abs_b_function(int a, int b) {
        return Arrays.asList(b).stream()
                .reduce(a, b > 0 ? ex1_4::add : ex1_4::sub);
    }

    public static void main(String[] args) {
        System.out.println("Class representing function using lambdas");
        System.out.println(new a_plus_abs_b(1, 2).apply());
        System.out.println(new a_plus_abs_b(1, -2).apply());
        System.out.println(new a_plus_abs_b(-1, 2).apply());
        System.out.println(new a_plus_abs_b(-1, -2).apply());
        System.out.println("Class representing function using function literal");
        System.out.println(new a_plus_abs_b_function_literal().apply(1, 2));
        System.out.println(new a_plus_abs_b_function_literal().apply(1, -2));
        System.out.println(new a_plus_abs_b_function_literal().apply(-1, 2));
        System.out.println(new a_plus_abs_b_function_literal().apply(-1, -2));
        System.out.println("Standard function using function literal");
        System.out.println(a_plus_abs_b_function(1, 2));
        System.out.println(a_plus_abs_b_function(1, -2));
        System.out.println(a_plus_abs_b_function(-1, 2));
        System.out.println(a_plus_abs_b_function(-1, -2));
    }
}

/*
 * Run in shell:
 * new ex1_4.a_plus_abs_b(1,-2).apply() == 3 => true
 */
