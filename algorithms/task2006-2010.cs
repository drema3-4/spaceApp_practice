using System;

namespace My
{
    partial class Algorithms
    {   
        static void task2006()
        {
            int santim = int.Parse(Console.ReadLine());
            int foots = (santim / 3 + (santim % 3 == 2 ? 1 : 0)) % 12;
            int duim = (santim / 3 + (santim % 3 == 2 ? 1 : 0)) / 12;

            Console.WriteLine(string.Format("{0} {1}", duim, foots));
        }

        static void task2007()
        {
            int num = int.Parse(Console.ReadLine());
            int degree = 0;

            for (int i = 0; i < Math.Sqrt(num) + 1; ++i)
            {
                if (num % Math.Pow(2, i) == 0)
                {
                    degree = i;
                }
            }

            Console.WriteLine(degree);
        }

        static void task2008()
        {
            string[] numAndLimit = Console.ReadLine().Split(' ');
            int n = int.Parse(numAndLimit[0]);
            int limit = int.Parse(numAndLimit[1]);
            string[] weights = Console.ReadLine().Split(' ');
            int countWeights = 0;

            for (int i = 0; i < n; ++i)
            {
                int weight = int.Parse(weights[i]);

                if (limit - weight >= 0)
                {
                    limit -= weight;
                    countWeights += 1;
                }
            }

            Console.WriteLine(string.Format("{0} {1}", countWeights, int.Parse(numAndLimit[1]) - limit));
        }

        static void task2009()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int twoOnDegree = 1;
            int sum = 0;

            for (int i = 0; i < n; ++i)
            {
                if (i == twoOnDegree - 1)
                {
                    sum += int.Parse(nums[i]);
                    twoOnDegree *= 2;
                }
            }

            Console.WriteLine(sum);
        }

        static void task2010()
        {
            string[] nums = Console.ReadLine().Split(' ');
            int first = int.Parse(nums[0]);
            int second = int.Parse(nums[1]);
            bool flag = true;
            int countSubstraction = 0;

            while(flag)
            {
                if (first == 0 || second == 0)
                {
                    break;
                }
                else
                {
                    if (first > second)
                    {
                        countSubstraction += first / second;
                        first = first % second;
                    }
                    else
                    {
                        countSubstraction += second / first;
                        second = second % first;
                    }
                }
            }

            Console.WriteLine(string.Format("{0} {1}", countSubstraction, first > second ? first : second));
        }
    }
}