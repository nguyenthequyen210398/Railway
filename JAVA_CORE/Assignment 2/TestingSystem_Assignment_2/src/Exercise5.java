import entity.Account;
import entity.Department;
import entity.Position;

import java.util.Scanner;

public class Exercise5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choose;
        while (true){
            System.out.println("Mời bạn chọn chức năng:" + "\n" + "1. Tạo account" + "\n" + "2. Tạo department");
            choose = sc.nextInt();
            if (choose == 1 || choose == 2){
                switch (choose){
                    case 1:
                        createAccount();
                        break;
                    case 2:
                        createDepartment();
                        break;
                }
                return;

            }else {
                System.out.println("Số bạn vừa chọn không đúng");
            }

        }

    }
    public static void createAccount(){
      Scanner sc = new Scanner(System.in);
        System.out.println("Mời bạn nhập vào thông tin account cần tạo");
        Account acc = new Account();
        System.out.println("Nhập ID: ");
        acc.id = sc.nextInt();
        System.out.println("Nhập email: ");
        acc.email = sc.next();
        System.out.println("Nhập userName: ");
        acc.userName = sc.next();
        System.out.println("Nhập fullName: ");
        acc.fullName = sc.next();
        System.out.println("Nhập position (Nhập các số từ 1 đến 4 tương ứng với với: 1.Dev, 2.Test, 3.Scrum_Master, 4.PM):");
        int posNum = sc.nextInt();
        switch (posNum){
            case 1:
                Position pos1 = new Position();
                pos1.name = Position.PositionName.Dev;
                acc.position = pos1;
                break;
            case 2:
                Position pos2 = new Position();
                pos2.name = Position.PositionName.Test;
                acc.position = pos2;
                break;
            case 3:
                Position pos3 = new Position();
                pos3.name = Position.PositionName.Scrum_Master;
                acc.position = pos3;
                break;
            case 4:
                Position pos4 = new Position();
                pos4.name = Position.PositionName.PM;
                acc.position = pos4;
                break;
        }
        System.out.println("Thông tin account vừa nhập: "
                + "\n" + "ID: " + acc.id
                + "\n" + "Email: " + acc.email
                + "\n" + "UserName: " + acc.userName
                + "\n" + "FullName: " + acc.fullName
                + "\n" + "Position: " + acc.position.name);


    }
    public static void createDepartment(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Mời bạn nhập vào thông tin Department");
        Department dep = new Department();
        System.out.println("Nhập ID: ");
        dep.id = sc.nextInt();
        System.out.println("Nhập Name: ");
        dep.name = sc.next();
        System.out.println("Thông tin Departmen vừa nhập là: "
                            + "\n" + "ID: " + dep.id
                            + "\n" + "Name: " + dep.name);

    }
}
