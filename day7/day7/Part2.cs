using System;
using System.Collections.Generic;

namespace day7
{
    class Part2
    {
        public static void Do(List<Directory> dirs)
        {
            int currSpace = 70000000 - dirs[0].GetSize();
            int bestDirSize = 70000000;
            for (int i = 1; i < dirs.Count; i++) // Start from 1 (ignore root)
            {
                int s = dirs[i].GetSize();
                if (s + currSpace >= 30000000)
                {
                    if (s < bestDirSize)
                        bestDirSize = s;
                }
            }

            Console.WriteLine(bestDirSize);
        }
    } 
}
