﻿// * Write a program that sorts an array of integers using the merge sort algorithm (find it in Wikipedia).

using System;

class MergeSortAlgorithm
{
    //merges two arrays
    static int[] MergeArrays(int[] left, int[] right)
    {
        int[] result = new int[left.Length + right.Length];

        int leftIncrease = 0;
        int rightIncrease = 0;

        for (int i = 0; i < result.Length; i++)
        {
            if (rightIncrease == right.Length || ((leftIncrease < left.Length) && (left[leftIncrease] <= right[rightIncrease])))
            {
                result[i] = left[leftIncrease];
                leftIncrease++;
            }
            else if (leftIncrease == left.Length || ((rightIncrease < right.Length) && (right[rightIncrease] <= left[leftIncrease])))
            {
                result[i] = right[rightIncrease];
                rightIncrease++;
            }
        }

        return result;
    }

    //recursevily merges two arrays
    static int[] MergeSort(int[] array)
    {
        if (array.Length <= 1)
        {
            return array;
        }

        int middle = array.Length / 2;
        int[] leftArray = new int[middle];
        int[] rightArray = new int[array.Length - middle];

        for (int i = 0; i < middle; i++)
        {
            leftArray[i] = array[i];
        }

        for (int i = middle, j = 0; i < array.Length; i++, j++)
        {
            rightArray[j] = array[i];
        }

        leftArray = MergeSort(leftArray);
        rightArray = MergeSort(rightArray);

        return MergeArrays(leftArray, rightArray);
    }

    static void PrintArray(int[] array)
    {
        for (int i = 0; i < array.Length; i++)
        {
            Console.Write(array[i] + " ");
        }
        Console.WriteLine();
    }

    static void Main()
    {

        Console.Write("Enter the size of array: ");
        int size = int.Parse(Console.ReadLine());
        int[] array = new int[size];
        Console.WriteLine("Enter the elements of the array");
        for (int i = 0; i < array.Length; i++)
        {
            array[i] = int.Parse(Console.ReadLine());

        }
        int[] sortedArray = MergeSort(array);

        PrintArray(sortedArray);
    }
}