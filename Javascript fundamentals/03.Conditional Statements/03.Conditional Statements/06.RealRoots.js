﻿// Write a script that enters the coefficients a, b and c of a quadratic equation
// a*x2 + b*x + c = 0
// and calculates and prints its real roots. Note that quadratic equations may have 0, 1 or 2 real roots.

var a = 1;
var b = 3;
var c = 2;
var x;
var x1;
var x2;
var discriminant = ((b * b) - 4 * a * c);

if (a == 0) {
    console.log("The equation is linear. Has root: " + ((-c) / b));
}
else if (discriminant == 0) {
    x = ((-b) / (2 * a));
    console.log("The equation has one root x1=x2=" + x);
}
else if (discriminant > 0) {
    x1 = ((-b) + Math.sqrt(discriminant)) / (2 * a);
    x2 = ((-b) - Math.sqrt(discriminant)) / (2 * a);
    console.log("The equation has roots x1= " + x1.toFixed(3) + ", x2= " + x2.toFixed(3));
}
else {
    console.log("Equation has no real roots!");
}