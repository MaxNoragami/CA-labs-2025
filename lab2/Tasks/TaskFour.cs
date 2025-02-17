using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2.Tasks
{
    static public class TaskFour
    {
        static public int ComputeSumFromString(string input)
        {
            int sum = 0;
            StringBuilder decimalEquivalent = new StringBuilder();
            // In C# the char is a 2 byte data type we extract the 16bits effectively and we are left with the numeric value, using bitwise operations
            foreach(var letter in input)
            {
                sum += letter & 0xFFFF;
                decimalEquivalent.Append(letter & 0xFFFF);
            }
            Console.WriteLine("Decimal Equivalent: {0}", decimalEquivalent.ToString());
            return sum;
        }
    }
}