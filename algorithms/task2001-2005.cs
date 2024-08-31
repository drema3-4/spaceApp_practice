using System;


// namespace My
// {
//     class Algorithms
//     {
//         public static void Main(string[] args)
//         {         
//         }
//     }
// }

namespace My
{
    partial class Algorithms
    {
        public static void Main(string[] args)
        {

           task2025();

            Console.ReadKey();
        }
    
        static void task2001()
        {
            string[] nums = Console.ReadLine().Split(' ');
            int a = int.Parse(nums[0]);
            int b = int.Parse(nums[1]);

            Console.WriteLine(a + b);
        }

        static void task2002()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int sum = 0;

            for (int i = 0; i < n; ++i)
            {
                sum += int.Parse(nums[i]);
            }

            Console.WriteLine(sum);
        }

        static void task2003()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int sum = 0;

            for (int i = 0; i < n; ++i)
            {
                if (i % 2 == 0)
                {
                    sum += int.Parse(nums[i]);
                }
                else
                {
                    sum -= int.Parse(nums[i]);
                }
                
            }

            Console.WriteLine(sum);
        }

        static void task2004()
        {
            int year = int.Parse(Console.ReadLine());

            if (year % 4 == 0 && year % 100 != 0)
            {
                Console.WriteLine(1);
            }
            else if (year % 400 == 0)
            {
                Console.WriteLine(1);
            }
            else
            {
                Console.WriteLine(0);
            }
        }

        static void task2005()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int min = int.Parse(nums[0]);
            int indexMin = 0;

            for (int i = 1; i < n; ++i)
            {
                int num = int.Parse(nums[i]);

                if (num < min)
                {
                    min = num;
                    indexMin = i;
                }
            }

            Console.WriteLine(indexMin + 1);
        }
    }
}