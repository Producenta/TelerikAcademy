﻿// Declare two string variables and assign them with “Hello” and “World”.
// Declare an object variable and assign it with the concatenation of the first two variables
//(mind adding an interval). Declare a third string variable and initialize it with
// the value of the object variable (you should perform type casting).


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;



class StringObject
{
    static void Main(string[] args)
    {
        string firstString = "Hello";
        string secondString = "World";
        object helloWorld = firstString + " " + secondString;
        Console.WriteLine(helloWorld);
        string thirdString = (string)helloWorld;
        Console.WriteLine(thirdString);       
    }
}
