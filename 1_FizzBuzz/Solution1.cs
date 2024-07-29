using System.Linq;
using System;

namespace app
{
    public class Solution1
    {
        public static readonly Dictionary<int, string> ruleDict = new Dictionary<int, string> { { 3, "Fizz" }, { 5, "Buzz" } };
        public static List<int> keyList = new List<int>();
        static void Main()
        {
            int n = Convert.ToInt32(Console.ReadLine());

            string result = "";
            for (int i = 1; i <= n; i++)
            {
                result += ConcatenateString(StringRuleResult(i), i);
            }
            Console.Write(result);
        }
        public static string ConcatenateString(string s, int x)
        {
            if (x != 1)
            {
                return ", " + s;
            }
            else
            {
                return s;
            }
        }
        public static string StringRuleResult(int a)
        {
            string ruleResult = "";
            if (ruleDict.ContainsKey(a))
            {
                ruleResult += ruleDict.ElementAt(ruleDict.Keys.ToList().IndexOf(a)).Value;

            }
            else
            {
                int totalBaseVal = 0;
                int index = 0;
                int tempVal = a;
                keyList = new List<int>();
                for (int i = 0; i < ruleDict.Count; i++)
                {
                    if (tempVal % ruleDict.ElementAt(index).Key == 0)
                    {
                        int keyRule = ruleDict.ElementAt(index).Key;
                        bool isInt = ((double)tempVal / (double)keyRule) % 1 == 0;
                        if (isInt)
                        {
                            // tempVal /= keyRule;
                            totalBaseVal++;
                            keyList.Add(ruleDict.ElementAt(index).Key);

                        }
                    }
                    index++;
                }
                if (totalBaseVal > 0)
                {
                    foreach (int i in keyList)
                    {
                        ruleResult += ruleDict.ElementAt(ruleDict.Keys.ToList().IndexOf(i)).Value;
                    }
                }
                else
                {
                    ruleResult += a.ToString();
                }
            }
            return ruleResult;
        }
    }
}