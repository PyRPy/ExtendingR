// a simple calculator in java
// https://www.geeksforgeeks.org/basic-calculator-program-using-java/
import java.io.*;
import java.lang.*;
import java.lang.Math; 
import java.util.Scanner;

public class Calculator 
{
    public static void main(String[] args)
    {
        double num1, num2; 
        Scanner sc = new Scanner(System.in);
        System.out.println("enter two numbers: ");

        num1 = sc.nextDouble();
        num2 = sc.nextDouble();

        System.out.println("enter the operator: (+,-,*,/)");

        char op = sc.next().charAt(0);
        double res = 0;

        switch (op)
        {
            case '+':
                res = num1 + num2;
                break;
            
            case '-':
                res = num1 - num2; 
                break;

            case '*':
                res = num1 * num2;
                break;

            case '/':
                res = num1 / num2;
                break;
            
            default:
                System.out.println("Wrong input, maybe");
                break;

        }

        System.out.println("the result is: ");
        System.out.println();
        System.out.println(num1 + " " + op + " " + num2 + " = " + res);

    }
}