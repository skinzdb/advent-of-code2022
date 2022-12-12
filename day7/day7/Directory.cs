using System;
using System.Collections.Generic;
using System.Text;

namespace day7
{
    class Directory
    {
        private string name;
        private Directory parent;
        private List<Directory> subdirs;
        private int size; // Size of files within folder (non-recursive)

        public Directory(string name, Directory parent)
        {
            this.name = name;
            this.parent = parent;
            subdirs = new List<Directory>();
            size = 0;
        }
        public string GetName() { return name; }
        public Directory GetParent() { return parent; }
        public int GetSize() // Get recursive size
        {
            int s = size;
            for (int i = 0; i < subdirs.Count; i++)
                s += subdirs[i].GetSize();
            return s;
        }
        public void AddSize(int filesize) { size += filesize; }

        public List<Directory> GetSubdirs() { return subdirs; }
        public void AddSubdir(Directory subdir) { subdirs.Add(subdir); }
        public void Print(int depth)
        {
            Console.WriteLine(new string(' ', depth) + "- " + name + " (" + GetSize() + ")");

            for (int i = 0; i < subdirs.Count; i++)
                subdirs[i].Print(depth + 1);
        }
    }

}
