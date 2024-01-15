// See https://aka.ms/new-console-template for more information
namespace Problem1
{
    class p1
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the first number:");
            string num1 = Console.ReadLine();
            Console.Write("Enter the second number:");
            string num2 = Console.ReadLine();

            //convert string to int
            int numtocal1 = Convert.ToInt32(num1);
            int numtocal2 = Convert.ToInt32(num2);

            //for check
            //Console.WriteLine("First is: " + num1);
            //Console.WriteLine("Second is: " + num2);

            //Console.WriteLine("First is: " + numtocal1);
            //Console.WriteLine("Second is: " + numtocal2);

            //Calculates
            int result1sum = numtocal1+ numtocal2;
            int result2difference = numtocal1- numtocal2;
            int result3product = numtocal1 * numtocal2;
            int result4quotient = numtocal1/ numtocal2;

            Console.WriteLine("Sum is: " + result1sum);
            Console.WriteLine("Difference is: " + result2difference);
            Console.WriteLine("Product is: " + result3product);
            Console.WriteLine("Quotient is: " + result4quotient);
        }
    }
}