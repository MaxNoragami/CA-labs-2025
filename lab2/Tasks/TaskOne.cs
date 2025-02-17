using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lab2.Tasks
{
    public class TaskOne
    {
        public void ComputeBinaryOctalHex(string? inputString)
        {
            int num;
            do
            {
                bool isInputValid = int.TryParse(inputString, out num);
                if(isInputValid) break;

                Console.Write("Enter a Decimal number: ");
                inputString = Console.ReadLine();
            }while(true);

            string binaryOutput = ComputeToCustomBase(num, 2);
            string octalOutput = ComputeToCustomBase(num, 8);
            string hexOutput = ComputeToCustomBase(num, 16);

            Console.WriteLine("Decimal: {0}", num);
            Console.WriteLine("Binary: {0}", binaryOutput);
            Console.WriteLine("Octal: {0}", octalOutput);
            Console.WriteLine("Hexadecimal: {0}", hexOutput);
        }

        private string ComputeToCustomBase(int num, int baseNum)
        {
            List<string> digits = new List<string>();
            Dictionary<int, string> forHexSys = new Dictionary<int, string>() {
                {10, "A"},
                {11, "B"},
                {12, "C"},
                {13, "D"},
                {14, "E"},
                {15, "F"}
            };

            do
            {
                int toBeAdded = num % baseNum;
                digits.Add(forHexSys.Keys.Contains(toBeAdded)? forHexSys[toBeAdded]:Convert.ToString(toBeAdded));
                num /= baseNum;
            }while(num >= 1);

            digits.Reverse();
            return string.Join("", digits);
        }

    }
}