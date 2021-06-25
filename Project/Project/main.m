//
//  main.m
//  Project
//
//  Created by Rida Abdulwasay on 7/12/19. 
//  Copyright © 2019 Rida Abdulwasay. All rights reserved.
//


#include <stdio.h>
#include<string.h>
#define Student_Size 100 //Create an array of student structures of size 100


struct Student //Create the Structure for Student
{
    char name[20];
    int midterm;
    int final;
};

//Declare the Function Prototypes
int CheckPassword(void);
void ADDstudent(struct Student StudentArray[], int *size);
void REMOVEstudent(struct Student StudentArray[], int *size);
void ENTERgrades(struct Student StudentArray[], int size);
void DISPLAYstudent(struct Student StudentArray[], int size);
void SORTname(struct Student StudentArray[], int size);
void SORTmidterm(struct Student StudentArray[], int size);
void SORTfinal(struct Student StudentArray[], int size);
void FINDaverage(struct Student StudentArray[], int size);

int main()
{
    printf("Attempting to Access the Student Grade Book...\n");
    int  i = CheckPassword();
    while (i != 0) //Use a while loop to keep repeating until correct password given
    {
        i = CheckPassword();
    }
    
    
    struct Student StudentArray[Student_Size];
    int currentSize = 0; //Set the current size to 0 because there are no students present in the array
    int choice; // Keeps track of which number is pressed
    
    
    do //Create the Menu based on given values from the Project Assignment
    {
        printf("\n\nWelcome to the Grade Book! What would you like to do?");
        printf("\n");
        printf("1 - Add a student\n");
        printf("2 - Remove a student\n");
        printf("3 - Enter grades for students\n");
        printf("4 - Display Name and Midterm and Final grades in a table format\n");
        printf("5 - Sort based on Names and list the Name, Midterm, and Final\n");
        printf("6 - Sort based on Midterm and list the Name, Midterm, and Final\n");
        printf("7 - Sort based on Final exam and list the Name, Midterm, and Final\n");
        printf("8 - Find class Median and Average for Final exam and Midterm\n");
        printf("---- Press 0 to quit ----\n\n");
        printf("Enter choice: ");
        scanf("%d", &choice);
        
        switch (choice) //Assign the appropriate command for the inputted number
        {
            case 0: //Leaves menu and terminates program
                printf("You will now quit the Menu...\n");
                return 0;
                
            case 1: // Adds student at the end of array
                ADDstudent(StudentArray, &currentSize);
                break;
                
            case 2: // Remove student from the array
                REMOVEstudent(StudentArray, &currentSize);
                break;
                
            case 3: // Prompts user to enter grades for each student
                ENTERgrades(StudentArray, currentSize);
                break;
                
            case 4: // Displays Name and midterm and final grades
                DISPLAYstudent(StudentArray, currentSize);
                break;
                
            case 5: // Sort based on names and list the name, midterm and final
                SORTname(StudentArray, currentSize);
                DISPLAYstudent(StudentArray, currentSize);
                break;
                
            case 6: // Sort based on midterm and list the name, midterm and final
                printf("\nNow sorting based on Midterm grades:\n");
                SORTmidterm(StudentArray, currentSize);
                DISPLAYstudent(StudentArray, currentSize);
                break;
                
            case 7: // Sort based on final exam and list the name, midterm and final
                printf("\nNow sorting based on Final grades:\n");
                SORTfinal(StudentArray, currentSize);
                DISPLAYstudent(StudentArray, currentSize);
                break;
                
            case 8: // Find class mean and average for final exam
                FINDaverage(StudentArray, currentSize);
                break;
                
            default: //Create a default in case other number is pressed
                if (choice != 0)
                {
                    printf("Sorry, that is not one of the choices!\n");
                }
        }
        
    }
    while (choice != 0); //Continue to do so while 0 is not pressed (other way to leave the menu)
    return 0;
}

//Create a Function to Check the Password
int CheckPassword()
{
    char password[20] = "123Password"; // Define the Password
    char userPassword[20];
    
    printf("\nPlease enter the password (Hint: The password is 123Password):"); //Ask user for password
    scanf("%s", userPassword); // Store the inputted password
    int i = strcmp(password, userPassword); // Use strcmp to check if password matches. Returns 0 if correct
    if (i == 0)
    {
        printf("\nCorrect Password!"); // Print if password correct
    }
    else
    {
        printf("\nIncorrect Password! Please try again."); // Print if password incorrect
    }
    return i;
}


//Create a Function to Add a Student
void ADDstudent(struct Student StudentArray[], int *size) // Pass pointer of size to update size
{
    if (*size < Student_Size) // Pass to the pointer of size to update the size
    {
        printf("Now adding information about Student %d\n", *size + 1); // Fix of by 1 error
        printf("Please enter Student %d name: ", *size + 1);
        
        scanf("%s", StudentArray[*size].name); //Get the name
        
        printf("Please enter Student %d Midterm score: ", *size + 1); //Get the midterm score
        scanf("%d", &StudentArray[*size].midterm);
        
        printf("Please enter Student %d Final score: ", *size + 1); //Get the final score
        scanf("%d", &StudentArray[*size].final);
        
        (*size)++; // Increment the size of the array
        printf("\nArray size now updated to %d", *size);
    }
    else
    {
        printf("\nArray is too big");
    }
}



//Create a Function to Remove a Student
void REMOVEstudent(struct Student StudentArray[], int *size)
{
    printf("Enter the name of the student you wish to remove: ");
    char student[20]; // Make a variable to store input name
    scanf("%s", student); // Store the name
    int i;
    for ( i = 0; i < *size; i++)
    {
        if (strcmp(StudentArray[i].name, student) == 0)
        {
            for (;i < *size; i++)   // i is the index of the student to delete
            {
                StudentArray[i] = StudentArray[i + 1]; // replace the student with student + 1
            }
            (*size)--; // Decrement/update size
            printf("\nStudent %s is now deleted from the records", student);
            printf("\nThe Array size is now updated to %d", *size);
        }
    }
    
    if (strcmp(StudentArray[i].name, student) != 0) //Case where wrong student name is given
    {
        printf("\nInvalid Student Name");
    }
}



//Create a Function to Enter Student Grades
void ENTERgrades(struct Student StudentArray[], int size) // Asks users to input grades for all the students
{
    for (int i = 0; i < size; i++)
    {
        printf("\nEnter the Midterm score for %s: ", StudentArray[i].name); //Put the grade for midterm
        scanf("%d", &StudentArray[i].midterm);
        
        printf("Enter the Final score for %s: ", StudentArray[i].name); //put the grade for final
        scanf("%d", &StudentArray[i].final);
    }
}


//Create a Function to Display Name and midterm and final grades in a table format
void DISPLAYstudent(struct Student StudentArray[], int size)
{
    printf("\n               Name      Midterm    Final\n");
    printf("            ___________________________________\n");
    for (int i = 0; i < size; i++)
    {
        printf("\n%20s%10d%10d\n", StudentArray[i].name, StudentArray[i].midterm, StudentArray[i].final);
    }
}




//Create a Function to Sort based on names and list the name, midterm and final
void SORTname(struct Student StudentArray[], int size)
{
    printf("Now sorting based on Names:\n");
    for (int j = 0; j < size; j++)
    {
        for (int i = 0; i < (size - 1); i++)
        {
            if (strcmp(StudentArray[i].name, StudentArray[i + 1].name) > 0)
            {
/* Compare the ASCII char values. If the value is < 0, the first different character has lower value in name 1 than name 2, If the value > 0, the first different character has greater value in name 1 than name 2 */
    
                struct Student temporary = StudentArray[i]; // Store greater the ASCII value
                StudentArray[i] = StudentArray[i + 1]; // Put lower ASCII value behind
                StudentArray[i + 1] = temporary; // Put the higher ASCII value  in front
            }
        }
    }
    
}

//Create a Function to Sort based on midterm and list the name, midterm and final
void SORTmidterm(struct Student StudentArray[], int size)
{
    for (int j = 0; j < size; j++)
    {
        for (int i = 0; i < size - 1; i++)
        {
            if (StudentArray[i].midterm > StudentArray[i + 1].midterm)
            {
                struct Student temporary = StudentArray[i]; // Create a temporary student as a base / aid
                StudentArray[i] = StudentArray[i + 1];
                StudentArray[i + 1] = temporary;
            }
        }
    }
}

//Create a Function to Sort based on final exam and list the name, midterm and final
void SORTfinal(struct Student StudentArray[], int size)
{
    for (int pass = 0; pass < size; pass++)
    {
        for (int i = 0; i < size - 1; i++)
        {
            if (StudentArray[i].final > StudentArray[i + 1].final)
            {
                struct Student temporary = StudentArray[i]; // Create a temporary student as a base / aid
                StudentArray[i] = StudentArray[i + 1];
                StudentArray[i + 1] = temporary;
            }
        }
    }
}

//Create a Function to Find class median and average for final exam
void FINDaverage(struct Student StudentArray[], int size)
{
    int ClassTotalMidterm = 0, ClassTotalFinal = 0;
    for (int i = 0; i < size; i++)
    {
        ClassTotalMidterm = StudentArray[i].midterm + ClassTotalMidterm; //Sum up the values
        ClassTotalFinal = StudentArray[i].final + ClassTotalFinal; //Sum up the values
    }
    printf("\nThe class has a Midterm average of: %d\n", ClassTotalMidterm / size);
    printf("The class has a Final average of: %d\n", ClassTotalFinal / size);
    
    
//Find the Median
    SORTmidterm (StudentArray, size);
    int medianForMidterm;
    if (size % 2 == 0) //If the number is even, add the 2 middle terms and divide by 2 to find median
    {
        medianForMidterm = (StudentArray[size / 2].midterm + StudentArray[(size - 1) / 2].midterm) / 2;
    }
    else //Otherwise, just find the middle term
    {
        medianForMidterm = StudentArray[size / 2].midterm;
    }
    printf("The Median for the Midterm is: %d\n", medianForMidterm);
    
    
    SORTfinal(StudentArray, size);
    int medianForFinal;
    if (size % 2 == 0) //If the number is even, add the 2 middle terms and divide by 2 to find median
    {
        medianForFinal = (StudentArray[size / 2].final + StudentArray[(size - 1) / 2].final) / 2;
    }
    else //Otherwise, just find the middle term
    {
        medianForFinal = StudentArray[size / 2].final;
    }
    printf("The Median for the Final is: %d", medianForFinal);
}


