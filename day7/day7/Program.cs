using System;
using System.Collections.Generic;
using System.Text;

namespace day7
{
    class Program
    {
        static void Main(string[] args)
        {
            Directory currDir = null;
            List<Directory> dirs = new List<Directory>(); // Could be more clever about how I find dirs by using inherent tree data structure created by Directory class 

            foreach (string line in System.IO.File.ReadLines(@"data.txt"))
            {
                string[] parts = line.Split(' ');

                switch (parts[0])
                {
                    case "$":
                        if (!parts[1].Equals("cd")) // Only care about `cd` commands
                            break;

                        if (parts[2].Equals("..")) // Jump up a dir
                        {
                            currDir = currDir.GetParent();
                            break;
                        }

                        bool flag = false; // Does directory already exist
                        Directory parent = currDir;
                        currDir = new Directory(parts[2], parent);

                        for (int i = 0; i < dirs.Count; i++)
                        {
                            if (currDir.GetName().Equals(dirs[i].GetName()) && currDir.GetParent() == dirs[i].GetParent())
                            {
                                currDir = dirs[i];
                                flag = true;
                                break;
                            }
                        }

                        if (!flag)
                        {
                            if (parent != null)
                                parent.AddSubdir(currDir);
                            dirs.Add(currDir);
                        }
                        break;
                    case "dir":
                        // Do nothing because children are added from the `cd` command
                        break;
                    default:  // aka `ls` output of a file (first part is size)
                        currDir.AddSize(int.Parse(parts[0]));
                        break;
                }
            }

            Console.WriteLine("Part 1: ");
            Part1.Do(dirs);
            Console.WriteLine("\nPart 2: ");
            Part2.Do(dirs);
        }
    }
}
