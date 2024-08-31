using System;
using System.Diagnostics;
using System.Text.Json.Serialization.Metadata;

namespace My
{
    partial class Algorithms
    {
        static void task2016()
        {
            
        }

        static void task2017()
        {
            string[] nums = Console.ReadLine().Split(' ');
            int a = int.Parse(nums[0]);
            int b = int.Parse(nums[1]);

            int maxNumDividers = 0;
            int numOfNecessaryNums = 0;

            for (int i = a; i <= b; ++i)
            {
                int currNumDividers = 0;

                for (int j = 1; j <= i / 2; ++j)
                {
                    if (i % j == 0)
                    {
                        currNumDividers += 1;
                    }
                }

                if (maxNumDividers < currNumDividers)
                {
                    maxNumDividers = currNumDividers;
                    numOfNecessaryNums = 1;
                }
                else if (currNumDividers == maxNumDividers)
                {
                    numOfNecessaryNums += 1;
                }
            }

            Console.WriteLine(numOfNecessaryNums);

            for (int i = a; i <= b; ++i)
            {
                int currNumDividers = 0;

                for (int j = 1; j <= i / 2; ++j)
                {
                    if (i % j == 0)
                    {
                        currNumDividers += 1;
                    }
                }

                if(currNumDividers == maxNumDividers)
                {
                    numOfNecessaryNums -= 1;

                    if (numOfNecessaryNums > 0)
                    {
                        Console.Write(string.Format("{0},", i));
                    }
                    else
                    {
                        Console.WriteLine(i);
                    }
                }
            }
        }

        static void task2018()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int currCount = 0; int period = 1;
            int sum = 0;


            for (int i = 0; i < n; ++i)
            {
                if (currCount < period)
                {
                    if (period % 2 != 0)
                    {
                        sum += int.Parse(nums[i]);
                    }
                    else
                    {
                        sum -= int.Parse(nums[i]);
                    }
                    currCount += 1;
                }
                else
                {
                    currCount = 1;
                    period += 1;

                    if (period % 2 != 0)
                    {
                        sum += int.Parse(nums[i]);
                    }
                    else
                    {
                        sum -= int.Parse(nums[i]);
                    }
                }
            }

            Console.WriteLine(sum);
        }

        static void task2019()
        {
            int n = int.Parse(Console.ReadLine());
            int countBooks = 1;
            int shelfNumber = 1;

            for (int i = 1; ; ++i)
            {
                if (countBooks > n)
                {
                    Console.WriteLine(shelfNumber - 1);
                    break;
                }

                shelfNumber += 1;
                countBooks += i;
            }
        }

        static void task2020()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int numOfMeet = 1;
            int currNum = int.Parse(nums[0]);
            int maxOfMeet = 1;
            int numMaxOfMeet = int.Parse(nums[0]);

            for (int i = 1; i < n; ++i)
            {
                int num = int.Parse(nums[i]);

                if (num == currNum)
                {
                    numOfMeet += 1;
                }
                else
                {
                    if (maxOfMeet < numOfMeet)
                    {
                        maxOfMeet = numOfMeet;
                        numMaxOfMeet = currNum;
                    }
                    
                    numOfMeet = 1;
                    currNum = num;
                }
            }

            Console.WriteLine(string.Format("{0} {1}", numMaxOfMeet, maxOfMeet));
        }
    }
}