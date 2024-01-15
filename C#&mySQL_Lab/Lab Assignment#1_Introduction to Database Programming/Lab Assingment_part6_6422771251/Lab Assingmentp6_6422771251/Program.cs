using System.Runtime.ExceptionServices;
using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace Problem6
{
    public class Student
    {
        static void Main(string[] args)
        {
            Console.WriteLine("===== Student Management System =====");
            Console.WriteLine("1. Add a new student");
            Console.WriteLine("2. Display all student");
            Console.WriteLine("3. Search student by ID");
            Console.WriteLine("4. Exit");

            List<string> name_list = new List<string>();
            List<int> age_list = new List<int>();
            int id = 0;

            while (true)
            {
                Console.Write("\nEnter your choice: ");
                string choice = (Console.ReadLine());

                if (choice == "1")
                {
                    id += 1;
                    Console.Write("\nEnter the student's name: ");
                    string name = Console.ReadLine();
                    Console.Write("Enter the student's age: ");
                    int age = Convert.ToInt32(Console.ReadLine());
                    name_list.Add(name);
                    age_list.Add(age);
                    Console.WriteLine("Student added successfully!");
                }

                else if (choice == "2")
                {
                    Console.WriteLine("\n----- List of Students -----");
                    for (int i = 0; i < id; i++)
                    {
                        int m = i + 1;
                        Console.WriteLine("ID: {0}, Name: {1}, Age: {2}", m, name_list[i], age_list[i]);
                    }

                }

                else if (choice == "3")
                {
                    Console.Write("\nEnter student ID to search: ");
                    int stu_id = Convert.ToInt32(Console.ReadLine());
                    if (stu_id <= id)
                    {
                        Console.Write("----- Student Found -----");
                        Console.WriteLine("\nID: {0}, Name: {1}, Age: {2}", stu_id, name_list[stu_id - 1], age_list[stu_id - 1]);

                    }
                    else
                    {
                        Console.WriteLine($"Student with ID {stu_id} not found");
                    }

                }

                else if (choice == "4")
                {
                    Console.Write("\nExiting the program...");
                    Console.ReadLine();

                    break;
                }
            }
        }
    }
}