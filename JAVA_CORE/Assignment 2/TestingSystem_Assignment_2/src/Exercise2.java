import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Exercise2 {
    public static void main(String[] args) {

        //Question 1:
        System.out.println("Question 1:");
        int i1 = 5;
        System.out.printf("%d%n",i1);
        System.out.println("\n");

        //Question 2:
        System.out.println("Question 2:");
        int i2 = 100000000;
        System.out.printf(Locale.US, "%, d%n", i2);
        System.out.println("\n");

        //Question 3:
        System.out.println("Question 3:");
        float i3 = 5.567098f;
        System.out.printf("%5.4f%n", i3 );
        System.out.println("\n");

        //Question 4:
        System.out.println("Question 4:");
        String s4 = "Nguyễn Văn A";
        System.out.printf("Tên tôi là \"" + s4  + "\" và tôi đang độc thân");
        System.out.println("\n");


        //Question 5:
        System.out.println("Question 5:");
        String patternDate = "dd/MM/yyyy HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patternDate);
        String date = simpleDateFormat.format(new Date());
        System.out.println(date);







    }

}
