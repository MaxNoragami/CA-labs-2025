using System.Globalization;
using lab2.Tasks;

namespace lab2
{
    public class Program
    {
        static void Main()
        {
            TaskOne taskOne = new TaskOne();
            Console.Write("Enter a Decimal number: ");
            string? inputString = Console.ReadLine();
            taskOne.ComputeBinaryOctalHex(inputString);

            TaskTwo taskTwo = new TaskTwo();
            Console.Write("Enter a base <= 36 you want to convert from: ");
            int baseNum = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter number in base {0}: ", baseNum);
            string? num = Console.ReadLine();
            taskTwo.ComputeToDecimal(num, baseNum);
        }
    }
}