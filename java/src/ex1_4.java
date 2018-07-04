import java.util.function.Supplier;

public class ex1_4 {

    static class a_plus_abs_b {
        Supplier<Integer> op;

        a_plus_abs_b(int a, int b) {
            op = b > 0 ? () -> a + b : () -> a - b;
        }

        int intValue() {
            return op.get();
        }
    }

    public static void main(String[] args) {
        System.out.println(new a_plus_abs_b(1,2).intValue());
        System.out.println(new a_plus_abs_b(1,-2).intValue());
        System.out.println(new a_plus_abs_b(-1,2).intValue());
        System.out.println(new a_plus_abs_b(-1,-2).intValue());
    }
}

/*
 * Run in shell:
 * new ex1_4.a_plus_abs_b(1,-2).intValue() == 3 => true
 */
