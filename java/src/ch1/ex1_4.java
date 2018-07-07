package ch1;

import java.util.Arrays;
import java.util.function.Supplier;

public class ex1_4 {

    static class a_plus_abs_b implements Supplier<Integer> {
        Supplier<Integer> op;

        a_plus_abs_b(int a, int b) {
            op = b > 0 ? () -> a + b : () -> a - b;
        }

        public Integer get() {
            return op.get();
        }
    }


    static class a_plus_abs_b_function_literal implements Supplier<Integer> {
        int a;
        int b;

        a_plus_abs_b_function_literal(int a, int b) {
            this.a = a;
            this.b = b;
        }

        static int add(int x, int y) {
            return x + y;
        }

        static int sub(int x, int y) {
            return x - y;
        }

        public Integer get() {
            return Arrays.asList(b).stream()
                    .reduce(a, b > 0 ? a_plus_abs_b_function_literal::add : a_plus_abs_b_function_literal::sub);
        }
    }

    public static void main(String[] args) {
        System.out.println(new a_plus_abs_b(1, 2).get());
        System.out.println(new a_plus_abs_b(1, -2).get());
        System.out.println(new a_plus_abs_b(-1, 2).get());
        System.out.println(new a_plus_abs_b(-1, -2).get());
        System.out.println(new a_plus_abs_b_function_literal(1, 2).get());
        System.out.println(new a_plus_abs_b_function_literal(1, -2).get());
        System.out.println(new a_plus_abs_b_function_literal(-1, 2).get());
        System.out.println(new a_plus_abs_b_function_literal(-1, -2).get());
    }
}

/*
 * Run in shell:
 * new ex1_4.a_plus_abs_b(1,-2).get() == 3 => true
 */
