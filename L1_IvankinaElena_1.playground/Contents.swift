import UIKit

import Foundation

print("Данная программа решает квадратные уравнения вида ax^2 + bx + c = 0")

var a = 5
print("Введено значение а =  \(a)")
var b = 5
print("Введено значение b =  \(b)")
var c = -10
print("Введено значение c =  \(c)")
print("Решаем квадратное уравнение вида \(a)x^2 + \(b)x + \(c) = 0")
var d: Double = Double (b*b - 4*a*c)


switch d{
    case _ where d > 0:
        let x = (Double(-b) + sqrt(d))/Double(2*a)
        let x2 = (Double(-b) - sqrt(d))/Double(2*a)
        print ("Уравнение имеет 2 корня x1 = \(x) и x2 = \(x2)")
    case _ where d == 0:
        let x = Double(-b/2*a)
        print ("Уравнение имеет 1 корень x = \(x)")
    default: print ("Данное квадратное уравнение не имеет решения")
}
