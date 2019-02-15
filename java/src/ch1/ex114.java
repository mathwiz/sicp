package ch1;

public class ex114 {
    public static void main(String[] args) {
        System.out.println(count_change(0) == 1);
        System.out.println(count_change(1) == 1);
        System.out.println(count_change(2) == 1);
        System.out.println(count_change(3) == 1);
        System.out.println(count_change(4) == 1);
        System.out.println(count_change(11) == 4);
        System.out.println(count_change(100) == 292);
        System.out.println("done");
    }

    static int count_change(int amount) {
        return cc(amount, 5);
    }

    static int cc(int amount, int kinds_of_coins) {
        if (amount == 0) return 1;
        if (amount < 0 || kinds_of_coins == 0) return 0;
        return cc(amount, kinds_of_coins - 1) +
                cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins);
    }

    static int biggest_denomination(int kinds_of_coins) {
        switch (kinds_of_coins) {
            case 1:
                return 1;
            case 2:
                return 5;
            case 3:
                return 10;
            case 4:
                return 25;
            case 5:
                return 50;
        }
        return Integer.MIN_VALUE;
    }
}
