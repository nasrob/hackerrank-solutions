package HackerRank.Java;

import java.text.NumberFormat;
import java.util.Locale;
import java.util.Scanner;

public class CurrencyFormatter {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double payment = scanner.nextDouble();
        scanner.close();

        // Write your code here.
        
        NumberFormat nfUs = NumberFormat.getCurrencyInstance(Locale.US);
        NumberFormat nfIn = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
        NumberFormat nfCn = NumberFormat.getCurrencyInstance(Locale.CHINA);
        NumberFormat nfFr = NumberFormat.getCurrencyInstance(Locale.FRANCE);
        
        String us = nfUs.format(payment);
        String india = nfIn.format(payment);
        String china = nfCn.format(payment);
        String france = nfFr.format(payment);
        
        System.out.println("US: " + us);
        System.out.println("India: " + india);
        System.out.println("China: " + china);
        System.out.println("France: " + france);
    }
}