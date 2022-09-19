import entity.Account;
import entity.Department;
import entity.Group;
import entity.Position;

import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {
        // tạo Department
        Department dep1 = new Department();
        dep1.id = 1;
        dep1.name = "Marketing";

        Department dep2 = new Department();
        dep2.id = 2;
        dep2.name = "Sale";

        Department dep3 = new Department();
        dep3.id = 3;
        dep3.name = "BOD";

        // Tạo Position
        Position pos1 = new Position();
        pos1.id = 1;
        pos1.name = Position.PositionName.Dev;

        Position pos2 = new Position();
        pos2.id = 2;
        pos2.name = Position.PositionName.PM;

        Position pos3 = new Position();
        pos3.id = 3;
        pos3.name = Position.PositionName.Scrum_Master;

        // Tạo Group
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Testing System";

        Group group2 = new Group();
        group2.id = 2;
        group2.name = "Development";

        Group group3 = new Group();
        group3.id = 3;
        group3.name = "Sale";

        // Tạo Account
        Account acc1 = new Account();
        acc1.id = 1;
        acc1.email = "daonq1@gmail.com";
        acc1.userName = "daonq1";
        acc1.fullName = "Dao Nguyen 1";
        acc1.department = dep1;
        acc1.position = pos1;
        acc1.createDate = LocalDate.now();
        acc1.groups = new Group[]{group1, group2};

        Account acc2 = new Account();
        acc2.id = 2;
        acc2.email = "daonq2@gmail.com";
        acc2.userName = "daonq2";
        acc2.fullName = "Dao Nguyen 2";
        acc2.department = dep2;
        acc2.position = pos2;
        acc2.createDate = LocalDate.of(2021, 02, 21);
        acc2.groups = new Group[]{group2, group3};

        Account acc3 = new Account();
        acc3.id = 3;
        acc3.email = "daonq3@gmail.com";
        acc3.userName = "daong3";
        acc3.fullName = "Dao Nguyen 3";
        acc3.department = dep3;
        acc3.position = pos3;
        acc3.createDate = LocalDate.now();
        acc3.groups = new Group[]{group1, group3};

        //Question 3: in ít nhất 1 giá trị của mỗi đối tượng ra
        System.out.println("Thông tin acc1: ");
        System.out.println("AccountID: " +  acc1.id);
        System.out.println("Email: " +  acc1.email);
        System.out.println("Username: " + acc1.userName);
        System.out.println("FullName: " + acc1.fullName );
        System.out.println("Department: " + acc1.department.name );
        System.out.println("PositionI: " + acc1.position.name );
        System.out.println("CreateDate: " + acc1.createDate);
    }
}
