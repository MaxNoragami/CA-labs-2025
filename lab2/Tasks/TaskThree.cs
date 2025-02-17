using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lab2.Tasks
{
    public class TaskThree
    {

        public void ComputeFromBaseToBase(string? inputString, int base1, int base2)
        {
            while(inputString == null)
            {
                Console.Write("Enter number in base {0}: ", base1);
                inputString = Console.ReadLine();
            }

            string outputFromBase1 = ComputeFromCustomBase(inputString, base1);
            string outputToBase2 = ComputeToCustomBase(Convert.ToInt32(outputFromBase1), base2);

            Console.WriteLine("Initally we had {0} in base {1}, but we got {2} by transforming it to base {3}", inputString, base1, outputToBase2, base2);
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