package entity;
public class Student extends Person {

    private String major;

    public Student(String fullName, int age, Gender gender, String address, String major) {
        super(fullName, age, gender, address);
        this.major = major;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Override
    public String toString() {
        // Tạo 1 đối tượng StringBuilder để nối chuỗi
        StringBuilder builder = new StringBuilder();
        builder.append("Engineer ")
                .append("[fullName = ")
                .append(super.getFullName()).append(",")
                .append("age = ")
                .append(super.getAge()).append(",")
                .append("gender = ")
                .append(super.getGender()).append(",")
                .append("address = ")
                .append(super.getAddress()).append(",")
                .append("major = ")
                .append(major).append("]");
        return builder.toString();
    }

}
