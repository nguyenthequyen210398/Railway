package backend;

import entity.Student;

import java.util.*;

public class Exercise1 {
    public static void question1() {

        List<Student> students = new ArrayList<>();
        students.add(new Student("name1"));
        students.add(new Student("name2"));
        students.add(new Student("name3"));
        students.add(new Student("name4"));
        students.add(new Student("name5"));
        students.add(new Student("name2"));
        students.add(new Student("name2"));
        for (Student student : students) {
            System.out.println(student);
        }

        System.out.println("1) In ra tổng số phần tử của students ");
        System.out.println("2) Lấy phần tử thứ 4 của students");
        System.out.println("3) In ra phần tử đầu và phần tử cuối của students ");
        System.out.println("4) Thêm 1 phần tử vào vị trí đầu của students");
        System.out.println("5) Thêm 1 phần tử vào vị trí cuối của students");
        System.out.println("6) Đảo ngược vị trí của students");
        System.out.println("7) Tạo 1 method tìm kiếm student theo id");
        System.out.println("8) Tạo 1 method tìm kiếm student theo name");
        System.out.println("9) Tạo 1 method để in ra các student có trùng tên");
        System.out.println("10) Xóa name của student có id = 2;");
        System.out.println("11) Delete student có id = 5;");
        System.out.println("12) Tạo 1 ArrayList tên là studentCopies và add tất cả students vào studentCopies");
        System.out.print("Hãy chọn để xem đáp án: ");

        Scanner sc = new Scanner(System.in);
        int choose = sc.nextInt();
        switch (choose) {
            case 1:
                System.out.println("a) In ra tổng số phần tử của students:" + "\n" + students.size());

                break;
            case 2:
                System.out.println("b) Lấy phần tử thứ 4 của students" + "\n" + students.get(3));

                break;
            case 3:
                System.out.println("c) In ra phần tử đầu và phần tử cuối của students" + "\n");
                System.out.println("phần tử đầu là: " + students.get(0) + "\n");
                System.out.println("phần tử cuối là: " + students.get(students.size() - 1));
                break;
            case 4:
                System.out.println("d) Thêm 1 phần tử vào vị trí đầu của students: " + "\n");
                students.add(0, new Student("name0"));
                for(Student student : students) {
                    System.out.println(student);
                }
                break;
            case 5:
                System.out.println("e) Thêm 1 phần tử vào vị trí cuối của students " + "\n");
                students.add(students.size() , new Student("name9"));
                for (Student student : students) {
                    System.out.println(student);
                }
                break;
            case 6:
                System.out.println("f) Đảo ngược vị trí của students " + "\n");
                Collections.reverse(students);
                for (Student student: students) {
                    System.out.println(student);
                }
                break;
            case 7:
                System.out.println("g) Tạo 1 method tìm kiếm student theo id");
                System.out.println("Nhập id student cần tìm kiếm: ");
                int id;
                id = sc.nextInt();
                for(Student student : students) {
                    if (student.getId() == id) {
                        System.out.println(student.getName());
                    }
                }
                break;
            case 8:
                System.out.println("h) Tạo 1 method tìm kiếm student theo name ");
                System.out.print("Nhập tên student cần tìm kiếm: ");
                String name;
                name = sc.next();
                name = name.toLowerCase();
                for(Student student: students) {
                    if (student.getName().equals(name)){
                        System.out.println(student);
                    }
                }
                break;
            case 9:
                System.out.println("i) Tạo 1 method để in ra các student có trùng tên ");

            case 13:
                return;

            default:
                System.out.println("Hãy chọn lại");



        }





    }


}
