
#include <stdio.h>
#include <string.h>

int main()
{

    FILE *f = fopen("data.txt", "r");
    char line[10];

    int max = -1;
    int elf_total = 0;

    while (fgets(line, 10, f) != NULL) 
    {
        int calories = atoi(line);

        if (calories)
        {
            elf_total += calories;
            if (elf_total > max)
                max = elf_total;
        }
        else    // 0 is a newline
        {
            elf_total = 0;
        }
    }

    printf("Highest Calories = %d\n", max);

    fclose(f);
}