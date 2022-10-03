package backend;

import entity.Account;

import java.util.Scanner;

public class Exercise1 {
    public static void Question1(){
        System.out.println("Question1");
        float salary1 = 5240.5F;
        float salary2 = 10970.055F;
        // tạo account1
        Account account1 = new Account();
        account1.salary = (int) salary1;
        // tạo account2
        Account account2  = new Account();
        account2.salary = (int) salary2;
        System.out.println("Lương của nhân viên 1 là " + account1.salary);
        System.out.println("Lương của nhân viên 2 là " + account2.salary);

    }
    public static void Question2(){
        System.out.println("\n" + "Question2");
        int min = 0;
        int max = 99999;
        int a = (int) (Math.random()*max) + min;
        while (a< 10000){
            System.out.println("Nếu số ngẫu nhiên < 10000: " + a);
            a = a*10;
        }
        System.out.println("số ngẫu nhiên: " + a);
    }
    public static void Question3(){
        System.out.println("\n" + "Question3");
        int min = 0;
        int max = 99999;
        int a = (int) (Math.random()*max) + min;
        while (a< 10000) {
            a = a * 10;

        }
        String stra = String.valueOf(a);
        System.out.println("Lấy 2 kí tự cuối của số " + a + ": "+ stra.substring(3));

    }
    public static void Question4(){
        int a, b;
        Scanner sc = new Scanner(System.in);
        System.out.println("\n" + "Question 4:");
        System.out.println("Nhập a = ");
        a = sc.nextInt();
        System.out.println("Nhập b = ");
        b = sc.nextInt();
        System.out.println("Thương của a và b là: " + (float)a / (float) b);
    }
}
