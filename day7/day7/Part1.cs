using System;
using System.Collections.Generic;

namespace day7
{
    class Part1
    {
        public static void Do(List<Directory> dirs)
        {
            int totalSizeOfSmallDirs = 0;
            for (int i = 0; i < dirs.Count; i++)
            {
                int s = dirs[i].GetSize();
                if (s < 100000)
                    totalSizeOfSmallDirs += s;
            }

            Console.WriteLine(totalSizeOfSmallDirs);
        }
    }
}
