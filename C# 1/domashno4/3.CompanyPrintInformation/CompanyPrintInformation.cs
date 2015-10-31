﻿// A company has name, address, phone number, fax number, web site and manager.
// The manager has first name, last name, age and a phone number. 
// Write a program that reads the information about a company and its manager and prints them on the console.


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;



class CompanyPrintInformation
{
    static void Main(string[] args)
    {
        Console.Write("Enter company name: ");
        string companyName = Console.ReadLine();
        Console.Write("Enter company address: ");
        string companyAddress = Console.ReadLine();
        Console.Write("Enter company phone number: ");
        string companyPhone = Console.ReadLine();
        Console.Write("Enter company fax number: ");
        string companyFax = Console.ReadLine();
        Console.Write("Enter company web site: ");
        string companyWebSite = Console.ReadLine();
        Console.Write("Enter company manager's first name: ");
        string managerFirstName = Console.ReadLine();
        Console.Write("Enter company manager's last name: ");
        string managerLastName = Console.ReadLine();
        Console.Write("Enter company manager's age: ");
        byte managerAge = byte.Parse(Console.ReadLine());
        Console.Write("Enter company manager's phone number: ");
        string managerPhone = Console.ReadLine();
        Console.WriteLine();
        Console.WriteLine("The {0} company is on address: {1}. Its phone number is {2} and the fax number is {3}." +
            " Its website is {4}. The manager of {0} is {5} {6}. He is {7} years old. His phone number is {8}",
            companyName, companyAddress, companyPhone, companyFax, companyWebSite, managerFirstName,
            managerLastName, managerAge, managerPhone);

    }
}

