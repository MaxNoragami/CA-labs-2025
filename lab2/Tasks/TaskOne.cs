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
            string thirtySixOutput = ComputeToCustomBase(num, 36);

            Console.WriteLine("Decimal: {0}", num);
            Console.WriteLine("Binary: {0}", binaryOutput);
            Console.WriteLine("Octal: {0}", octalOutput);
            Console.WriteLine("Hexadecimal: {0}", hexOutput);
            Console.WriteLine("36 Base: {0}", thirtySixOutput);
        }

        private string ComputeToCustomBase(int num, int baseNum)
        {
            List<string> wholeDigits = new List<string>();
            Dictionary<int, string> forHexSys = new Dictionary<int, string>() {
                {10, "A"}, {11, "B"}, {12, "C"}, {13, "D"}, {14, "E"},
                {15, "F"}, {16, "G"}, {17, "H"}, {18, "I"}, {19, "J"},
                {20, "K"}, {21, "L"}, {22, "M"}, {23, "N"}, {24, "O"},
                {25, "P"}, {26, "Q"}, {27, "R"}, {28, "S"}, {29, "T"},
                {30, "U"}, {31, "V"}, {32, "W"}, {33, "X"}, {34, "Y"},
                {35, "Z"}
            };

            do
            {
                int toBeAdded = num % baseNum;
                wholeDigits.Add(forHexSys.Keys.Contains(toBeAdded)? forHexSys[toBeAdded]:Convert.ToString(toBeAdded));
                num /= baseNum;
            }while(num >= 1);

            wholeDigits.Reverse();
            
            return string.Join("", wholeDigits);
        }

    }
}