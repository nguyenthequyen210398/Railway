package backend;

import entity.Account;

import java.time.LocalDate;

public class Exercise2 {
public static void Question1 (){

    Account[] accArray = new Account[5];
    for (int i = 1 ; i < accArray.length; i++) {
        Account acc = new Account();

        acc.email = "Email " + i;
        acc.userName = "User Name " + i;
        acc.fullName = "Full Name " + i;
        acc.createDate = LocalDate.now();
        accArray[i] = acc;
        System.out.println("Thông tin account " + i + " là " + acc);
    }
}
}
