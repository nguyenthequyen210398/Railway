package frontend;

import backend.Exercise5;
import entity.Staff;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class program5 {
    private List<Staff> Staffs = new ArrayList<>();

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;
        boolean exit = false;
        do {
            Exercise5.menu();
            choice = sc.nextInt();
            switch (choice){
                case 1:
                    Exercise5.addStaff();
                    break;

                case 2:
                    Staff staff = Exercise5.searchByName();
                    if (staff != null) {
                        System.out.println(staff);
                    } else {
                        System.out.println("không tìm thấy thông tin");
                    }
                    break;

                case 3:
                    Exercise5.showListStaff();
                    break;

                case 4:
                    Exercise5.deleteByName();
                    break;

                case 5:
                    exit = true;
                    break;

                default:
                    System.out.println("Bạn đã chọn sai chức năng mời nhập lại");
                    break;
            }
         } while (!exit);
    }
}
