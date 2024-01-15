using System.Runtime.ExceptionServices;

namespace Problem3
{
    class p3
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of integers as input from the user: ");
            int nummerofelements = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter " + nummerofelements +" integer elements:");
            int[] array = new int[nummerofelements];
            for(int i=0; i<nummerofelements; i++)
            {
                Console.Write("Element {0}: ", i+1);
                array[i] = int.Parse(Console.ReadLine());
                //for check
                //Console.WriteLine(array[i]);
            }
            //calulate sum
            double sum = 0;
            for (int i=0; i<array.Length; i++)
            {
                sum += array[i];
            }
            Console.WriteLine("Sum of elements: {0}", sum);
            Console.WriteLine("Maximum element: {0}", array.Max());
            Console.WriteLine("Minimum element: {0}", array.Min());
            //calulate avg
            double avg = sum / array.Length;
            Console.WriteLine("Average of elements: {0}", avg);

        }
    }
}