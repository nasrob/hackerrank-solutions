package HackerRank.Java;

import java.io.*;
import java.util.*;
import java.util.stream.IntStream;

public class NegativeSubarrays {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        
        Scanner scanner = new Scanner(System.in);
        
        int n = scanner.nextInt();
        
        int[] arr = new int[n];
        for(int i = 0; i < n; i++) {
            arr[i] = scanner.nextInt();
        }
        scanner.close();
        
        long count = countNegativeSubArrays(arr);
        System.out.println(count);
    }
    
    public static long countNegativeSubArrays(int[] arr) {
        return IntStream.range(0, arr.length)
            .mapToLong(i -> IntStream.rangeClosed(i, arr.length)
                .mapToLong(j -> Arrays.stream(arr, i, j).sum())
                .filter(sum -> sum < 0)
                .count()
            ).sum();
    }

    public static long countNegativeSubArrays2(int[] arr) {
        long count = 0;
        for (int i = 0; i < arr.length; i++) {
            int sum = 0;

            for (int j = 0; j < arr.length; j++) {
                sum += arr[j];
                if (sum < 0) {
                    count++;
                }
            }
        }

        return count;
    }
}
