package backend;

import entity.Employee;
import entity.Engineer;
import entity.Staff;
import entity.Worker;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Exercise5 {
  private static final List<Staff> staffs = new ArrayList<>();
  private static final Scanner sc = new Scanner(System.in);
  public static void menu(){
    System.out.println("----------------------------------");
    System.out.println("1. Thêm mới cán bộ");
    System.out.println("2. Tìm kiếm theo họ tên");
    System.out.println("3. Hiện thị thông tin về danh sách các cán bộ.");
    System.out.println("4. Nhập vào tên của cán bộ và delete cán bộ đó");
    System.out.println("5. Thoát khỏi chương trình.");
    System.out.println("----------------------------------");
    System.out.print("Mời nhập vào sự lựa chọn của bạn: ");

  }
  public static void addStaff() {
    System.out.println("+------- Lựa chọn chức năng bạn muốn sử dụng -------+");
    System.out.println("1.Thêm Worker");
    System.out.println("2.Thêm Engineer");
    System.out.println("3.Thêm Employee");
    System.out.print("Hãy nhập vào sự lựa chọn của bạn: ");
    int choice = Integer.parseInt(sc.nextLine());
    System.out.println("Nhập vào tên: ");
    String name = sc.nextLine();
    System.out.println("Nhập vào tuổi: ");
    int age = Integer.parseInt(sc.nextLine());
    System.out.println("Nhập vào giới tính Worker 1.Male, 2.Female, 3.Unknown");
    int choiseGender = Integer.parseInt(sc.nextLine());
    Staff.Gender gender;
    switch (choiseGender) {
        case 1:
          gender = Staff.Gender.nam;
          break;

        case 2:
          gender = Staff.Gender.nữ;
          break;

        default:
          gender = Staff.Gender.khác;
          break;
    }
    System.out.println("Nhập vào địa chỉ: ");

    String address = sc.nextLine();

    switch (choice) {
      // Tạo Worker nếu chọn 1
      case 1:
        System.out.println("Nhập vào bậc: ");
        int rank = sc.nextInt();
        Staff worker = new Worker(name, age, gender, address, rank);
        staffs.add(worker);
        break;
      // Tạo Engineer nếu chọn 2
      case 2:
        System.out.println("Nhập vào chuyên nghành: ");
        String specialized = sc.next();
        Staff engineer = new Engineer(name, age, gender, address, specialized);
        staffs.add(engineer);
        break;
      // Tạo  Employee nếu chọn 3
      case 3:
        System.out.println("Nhập vào nhiệm vụ: ");
        String task = sc.next();
        Staff employee = new Employee(name, age, gender, address, task);
        staffs.add(employee);
        break;

      default:
        System.out.println("Bạn đã chọn sai chức năng mời bạn chạy lại chương trình và chọn lại các chức năng từ 1 đến 3");
        break;
    }

  }

  public static Staff searchByName(){
    System.out.println("Nhập vào tên bạn muốn tìm kiếm");
    String name = sc.nextLine();
    for (Staff staff : staffs) {
      if (name.equalsIgnoreCase(staff.getName())) {
        System.out.println(staff);
        return staff;
      }
    }

    return null;
  }

  public static void showListStaff() {
    System.out.println("+------- Danh sách nhân viên -------+");
    for (Staff staff : staffs) {
      System.out.println(staff);
    }

  }

  public static void deleteByName() {
    System.out.println("Nhập vào tên bạn muốn xóa");
    String name = sc.nextLine();
    for (Staff staff : staffs) {
      if (name.equalsIgnoreCase(staff.getName())) {
        staffs.remove(staff);
      }else {
        System.out.println("Không tìm thấy thông tin nhân viên với tên này");
      }
    }
  }
}