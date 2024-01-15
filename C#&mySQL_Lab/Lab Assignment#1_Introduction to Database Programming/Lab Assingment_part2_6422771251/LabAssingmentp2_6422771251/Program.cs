
using System.Security.Cryptography.X509Certificates;
namespace Problem2
{
    class p2
    {
        static void Main(string[] args)
        {

            int N1;
            Console.Write("Enter N1: ");
            N1 = int.Parse(Console.ReadLine());
            int N2;
            Console.Write("Enter N2: ");
            N2 = int.Parse(Console.ReadLine());
            int sum = 0;
            while( N1 != 0 && N2 != 0)
            {
                for (int i = N1; i <= N2; i++)
                {
                    sum += i;
                }
                Console.WriteLine("The sum of the sequence number from {0} to {1} = {2}", N1, N2, sum);
                Console.ReadLine();
                break;
            }
                   
        }
    }
}
