package backend;

import java.util.Scanner;

public class Exercise4 {
    public static void Question1(){
        System.out.println("Question 1:");
        Scanner sc = new Scanner(System.in);
        System.out.println("Mời nhập vào 1 chuỗi: ");
        String s1 = sc.nextLine();
        String[] strings = s1.split(" ");
        System.out.println("số kí tự: " + strings.length);

    }
    public static void Question2(){
        System.out.println("\n" + "Question2");
        System.out.println("Nhập vào chuỗi 1: ");
        Scanner sc1 = new Scanner(System.in);
        String S1 = sc1.next();
        System.out.println("Nhập vào chuỗi 2: ");
        String S2 = sc1.next();
        System.out.println("Kết quả sau khi nối chuỗi: " + S1 + " " + S2);

    }
    public static void Question3(){
        System.out.println("\n" + "Question3");
        System.out.println("Mời nhâp tên của bạn: ");
        Scanner sc = new Scanner(System.in);
        String name = sc.next();
        String firstName = name.substring(0,1).toUpperCase();
        String leftName = name.substring(1);
        System.out.println("chữ cái đầu là:" + name.charAt(0) + " chưa viết hoa");
        name = firstName + leftName;
        System.out.println("Tên sửa thành: " + name);


    }

    public  static void Question4(){
        System.out.println("\n"+"Question4");
        System.out.println("Mời nhập tên: ");
        Scanner sc = new Scanner(System.in);
        String name = sc.nextLine();
        name = name.toUpperCase();
        for (int i = 0; i < name.length(); i++) {
            System.out.println("kí tự thứ " + (i +1) + " là: " + name.charAt(i));
        }
    }

    public static void Question5(){
        System.out.println("\n" + "Question5");
        Scanner sc = new Scanner(System.in);
        System.out.println("Mời nhập họ: ");
        String firstName = sc.nextLine();
        System.out.println("Mời nhập tên: ");
        String lastName = sc.nextLine();
        System.out.println("Họ tên bạn là: " + firstName + " " + lastName);
    }

    public static void Question6(){
        System.out.println("\n" + "Question6");
        String fullName;
        String lastName = "", middleName = "", firstName = "";
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập họ tên đầy đủ:");
        fullName = scanner.nextLine();
// Chuẩn hóa xâu
        fullName = fullName.trim();
        String[] words = fullName.split(" ");
        lastName = words[0];
        firstName = words[words.length - 1];
        for (int i = 1; i <= words.length - 2; i++) {
            middleName += words[i] + " ";
        }
        System.out.println("Họ là: " + lastName);
        System.out.println("Tên đệm là: " + middleName);
        System.out.println("Tên là: " + firstName);
        
    }
}
