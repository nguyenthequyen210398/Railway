package entity;

public class student {
    private int id;
    private String name;
    public static String college = "Đại học Bách Khoa";
    private static int count = 0;

    public student(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
