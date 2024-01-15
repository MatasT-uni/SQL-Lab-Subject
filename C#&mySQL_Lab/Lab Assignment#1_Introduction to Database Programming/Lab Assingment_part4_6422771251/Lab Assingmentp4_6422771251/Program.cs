using System.Runtime.ExceptionServices;

namespace Problem4
{
    class p4
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of students: ");
            int nummerofelements = Convert.ToInt32(Console.ReadLine());
            int[] array = new int[nummerofelements];
            for (int i = 0; i < nummerofelements; i++)
            {
                Console.Write("Enter the score for student {0}: ", i + 1);
                array[i] = int.Parse(Console.ReadLine());
                //for check
                //Console.WriteLine(array[i]);
            }
            //calulate sum
            double sum = 0;
            for (int i = 0; i < array.Length; i++)
            {
                sum += array[i];
            }
            //calulate avg
            double avg = sum / array.Length;
            Console.WriteLine("Average of elements: {0}", avg);

        }
    }
}