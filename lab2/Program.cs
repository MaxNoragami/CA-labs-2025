using System.Globalization;
using lab2.Tasks;

namespace lab2
{
    public class Program
    {
        static void Main()
        {
            Console.WriteLine("\n--------- Task 1 ---------\n");
            TaskOne taskOne = new TaskOne();
            Console.Write("Enter a Decimal number: ");
            string? inputStringTask1 = Console.ReadLine();
            taskOne.ComputeBinaryOctalHex(inputStringTask1);
            Console.WriteLine("\n--------------------------\n");

            Console.WriteLine("\n--------- Task 2 ---------\n");
            TaskTwo taskTwo = new TaskTwo();
            Console.Write("Enter a base 'p', where p <= 36: ");
            int baseNum = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter number in base {0}: ", baseNum);
            string? inputStringTask2 = Console.ReadLine();
            taskTwo.ComputeToDecimal(inputStringTask2, baseNum);
            Console.WriteLine("\n--------------------------\n");

            Console.WriteLine("\n--------- Task 3 ---------\n");
            TaskThree taskThree = new TaskThree();
            Console.Write("Enter a base 'p', where p <= 36: ");
            int base1Num = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter number in base {0}: ", base1Num);
            string? inputStringTask3 = Console.ReadLine();
            Console.Write("Enter a base 'q', where q <= 36: ");
            int base2Num = Convert.ToInt32(Console.ReadLine());
            taskThree.ComputeFromBaseToBase(inputStringTask3, base1Num, base2Num);
            Console.WriteLine("\n--------------------------\n");
        }
    }
}