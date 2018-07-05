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

    public static void main(String[] args) {
        System.out.println(new a_plus_abs_b(1,2).get());
        System.out.println(new a_plus_abs_b(1,-2).get());
        System.out.println(new a_plus_abs_b(-1,2).get());
        System.out.println(new a_plus_abs_b(-1,-2).get());
    }
}

/*
 * Run in shell:
 * new ex1_4.a_plus_abs_b(1,-2).get() == 3 => true
 */
