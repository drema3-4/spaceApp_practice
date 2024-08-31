using System;

namespace My
{
    partial class Algorithms
    {
        static void task2021()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int[] prerearedNums = new int[n];

            for (int i = 0; i < n; ++i)
            {
                prerearedNums[i] = int.Parse(nums[i]);
            }

            int max = prerearedNums[0];
            for (int i = 1; i < n; ++i)
            {
                if (max < prerearedNums[i])
                {
                    max = prerearedNums[i];
                }
            }

            for (int i = 0; i < n; ++i)
            {
                if (prerearedNums[i] == max)
                {
                    prerearedNums[i] = prerearedNums[i] / 2;
                }
            }

            max = prerearedNums[0];
            for (int i = 1; i < n; ++i)
            {
                if (max < prerearedNums[i])
                {
                    max = prerearedNums[i];
                }
            }

            for (int i = 0; i < n; ++i)
            {
                if (prerearedNums[i] == max)
                {
                    prerearedNums[i] = prerearedNums[i] / 2;
                }
            }

            for(int i = 0; i < n - 1; ++i)
            {
                Console.Write(string.Format("{0} ", prerearedNums[i]));
            }
            Console.WriteLine(prerearedNums[n - 1]);
        }

        static void task2022()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int[] prepearedNums = new int[n];
            int numOfPair = 0;

            for (int i = 0; i < n; ++i)
            {
                prepearedNums[i] = int.Parse(nums[i]);
            }

            for (int i = 0; i < n; ++i)
            {
                for (int j = 0; j < n; ++j)
                {
                    if (i == j)
                    {
                        continue;
                    }

                    if (prepearedNums[i] % prepearedNums[j] == 0)
                    {
                        numOfPair += 1;
                    }
                }
            }

            Console.WriteLine(numOfPair);
        }

        static void task2023()
        {
            int n1 = int.Parse(Console.ReadLine());
            string[] nums1 = Console.ReadLine().Split(' ');
            int[] prepearedNums1 = new int[n1];
            int n2 = int.Parse(Console.ReadLine());
            string[] nums2 = Console.ReadLine().Split(' ');
            int[] prepearedNums2 = new int[n2];

            int countRezNums = 0;
            int[] rez = new int[n1];

            for (int i = 0; i < n1; ++i)
            {
                prepearedNums1[i] = int.Parse(nums1[i]);
            }
            for (int i = 0; i < n2; ++i)
            {
                prepearedNums2[i] = int.Parse(nums2[i]);
            }

            for (int i = 0; i < n1; ++i)
            {
                bool flag = false;
                for (int j = 0; j < n2; ++j)
                {
                    if (prepearedNums1[i] == prepearedNums2[j])
                    {
                        flag = true;
                        break;
                    }
                }
                
                if (flag)
                {
                    rez[countRezNums] = prepearedNums1[i];
                    countRezNums += 1;
                }
            }

            Console.WriteLine(countRezNums);
            if (countRezNums != 0)
            {
                for (int i = 0; i < countRezNums - 1; ++i)
                {
                    Console.Write(string.Format("{0} ", rez[i]));
                }
                Console.WriteLine(rez[countRezNums - 1]);
            }
        }

        static void task2024()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int countChanges = 0;

            for (int i = 0; i < n / 2; ++i)
            {
                if (nums[i] != nums[n - 1 -i])
                {
                    countChanges += 1;
                }
            }

            Console.WriteLine(countChanges);
        }

        static void task2025()
        {
            int n = int.Parse(Console.ReadLine());
            string[] nums = Console.ReadLine().Split(' ');
            int[] prepearedNums = new int[n];
            int m = int.Parse(Console.ReadLine());
            int[] mins = new int[m];

            for (int i = 0; i < n; ++i)
            {
                prepearedNums[i] = int.Parse(nums[i]);
            }

            for (int i = 0; i < m; ++i)
            {
                string[] borders = Console.ReadLine().Split(' ');
                int l = int.Parse(borders[0]) - 1;
                int r = int.Parse(borders[1]) - 1;

                int min = prepearedNums[l];

                for (int j = l + 1; j <= r; ++j)
                {
                    if (min > prepearedNums[j])
                    {
                        min = prepearedNums[j];
                    }
                }

                mins[i] = min;
            }

            for (int i = 0; i < m; ++i)
            {
                Console.WriteLine(mins[i]);
            }
        }
    }
}