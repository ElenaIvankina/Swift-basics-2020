import UIKit

print ("Даны значения 2 катетов прямоугольного треугольника для вычисления значений гипотенузы, периметра, площади")

var a: Double = 10
print ("Значение катета a \(a)")
var b: Double = 10
print ("Значение катета b \(b)")
var c = sqrt(pow(a,2) + pow(b,2))
print("Гипотенуза равна \(String(format: "%.2f", c))")
var p = a + b + c
print("Периметр равен \(String(format: "%.2f", p))")
var s = (a*b)/2
print("Площадь равна \(String(format: "%.2f", s))")

