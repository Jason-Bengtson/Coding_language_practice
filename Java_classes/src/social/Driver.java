package social;
//Jason Bengtson
//ESOF 322
//Design Patterns Extra Credit
//Social Media

import java.util.Scanner;

public class Driver {

    public static void main(String[] args) {

        System.out.println("Enter your new friend's name for facebook (ex: Ace Ventura )");
        Scanner scanner = new Scanner(System.in);
        String friend = scanner.nextLine();

        hub conn = new hub(new Facebook());
        conn.connectToFriend(friend);


        System.out.println("Enter your new friend's name for Twitter");
        Scanner scanner2 = new Scanner(System.in);
        String friend2 = scanner2.nextLine();

        conn.setFriend(new Twitter());
        conn.connectToFriend(friend2);


        System.out.println("Enter your new friend's name for Instagram");
        Scanner scanner3 = new Scanner(System.in);
        String friend3 = scanner3.nextLine();

        conn.setFriend(new Instagram());
        conn.connectToFriend(friend3);


        System.out.println("Enter your new friend's name for Snap chat");
        Scanner scanner4 = new Scanner(System.in);
        String friend4 = scanner4.nextLine();

        conn.setFriend(new Snapchat());
        conn.connectToFriend(friend4);


    }
}
