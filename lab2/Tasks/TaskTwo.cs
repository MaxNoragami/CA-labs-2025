using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lab2.Tasks
{
    public class TaskTwo
    {
        public void ComputeToDecimal(string? inputString, int baseNum)
        {
            while(inputString == null)
            {
                Console.Write("Enter number in base {0}: ", baseNum);
                inputString = Console.ReadLine();
            }
            string output = ComputeFromCustomBase(inputString, baseNum);

            Console.WriteLine("Base {0}: {1}", baseNum, inputString);
            Console.WriteLine("Decimal: {0}", output);
        }

        private string ComputeFromCustomBase(string num, int baseNum)
        {
            int sum = 0;

            string reversedString = new string(num.Reverse().ToArray());

            for(int i = 0; i < reversedString.Length; i++)
            {
                sum += (!char.IsDigit(reversedString[i])?Convert.ToInt32(reversedString[i]) - 55: reversedString[i] - 48) * ((int) Math.Pow(baseNum, i));
            }
  
            return Convert.ToString(sum);
        }

    }
}