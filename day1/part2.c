
#include <stdio.h>
#include <string.h>

int main()
{

    FILE *f = fopen("data.txt", "r");
    char line[10];

    int max1, max2, max3 = -1;
    int elf_total = 0;

    while (fgets(line, 10, f) != NULL) 
    {
        int calories = atoi(line);

        if (calories)
        {
            elf_total += calories;
            if (elf_total > max3)
            {
                if (elf_total > max2)
                {
                    if (elf_total > max1)
                    {
                        max3 = max2;
                        max2 = max1;
                        max1 = elf_total;
                    }
                    else
                    {
                        max3 = max2;
                        max2 = elf_total;
                    }
                }
                else
                    max3 = elf_total;
            }
       
        }
        else    // 0 is a newline
        {
            elf_total = 0;
        }
    }

    printf("Highest Calories = %d\n", max1);
    printf("2nd Highest Calories = %d\n", max2);
    printf("3rd Highest Calories = %d\n", max3);

    printf("Combined = %d", max1 + max2 + max3);

    fclose(f);
}