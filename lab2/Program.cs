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
        }
    }
}