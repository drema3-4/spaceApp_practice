using System;

namespace My
{
    partial class Algorithms
    {
        static void task2011()
        {
            int age = int.Parse(Console.ReadLine());

            if (age < 7)
            {
                Console.WriteLine("preschool child");
            }
            else if (age < 18)
            {
                Console.WriteLine(string.Format("schoolchild {0}", age - 7 + 1));
            }
            else if (age < 23)
            {
                Console.WriteLine(string.Format("student {0}", age - 18 + 1));
            }
            else
            {
                Console.WriteLine("specialist");
            }
        }

        static void task2012()
        {
            string[] first = Console.ReadLine().Split(' ');
            int a1 = int.Parse(first[0]); int b1 = int.Parse(first[1]);
            string[] second = Console.ReadLine().Split();
            int a2 = int.Parse(second[0]); int b2 = int.Parse(second[1]);

            if (a1 == b1 && a1 == a2 && a1 == b2)
            {
                Console.WriteLine("YES");
            }
            else
            {
                if (a1 == a2 && (a1 + a2) > (b1 + b2))
                {
                    if (b1 + b2 == a1)
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }
                }
                else if (a1 == b2 && (a1 + b2) > (b1 + a2))
                {
                    if (b1 + a2 == a1)
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }
                }
                else if (b1 == a2 && (b1 + a2) > (a1 + b2))
                {
                    if (a1 + b2 == b1)
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }
                }
                else if (b1 == b2 && (b1 + b2) > (a1 + a2))
                {
                    if (a1 + a2 == b1)
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }
                }
                else
                {
                    Console.WriteLine("NO");
                }
            }
        }

        static void task2013()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int min = int.Parse(nums[0]);
            int countMin = 1;

            for (int i = 1; i < n; ++i)
            {
                int num = int.Parse(nums[i]);

                if (min > num)
                {
                    countMin = 1;
                    min = num;
                }
                else
                {
                    if (num == min)
                    {
                        countMin += 1;
                    }
                }
            }

            Console.WriteLine(countMin);
        }

        static void task2014()
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

        static void task2015()
        {
            int n = int.Parse(Console.ReadLine());

            for (int i = 2; i <= n; ++i)
            {
                bool flag = true;
                for (int j = 2; j < Math.Sqrt(i) + 1; ++j)
                {
                    if (i % j == 0 && i != 2)
                    {
                        flag = false;
                        break;
                    }
                }

                if (flag)
                {
                    Console.WriteLine(i);
                }
            }
        }
    }
}