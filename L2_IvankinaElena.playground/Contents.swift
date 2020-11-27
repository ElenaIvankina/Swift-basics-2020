import UIKit

// 1 пункт Написать функцию, которая определяет, четное число или нет

func isOdd (_ a: Int) -> Bool{
    if a%2 == 0 {
        return true
    } else {
        return false
    }
}
var a = 99
var b = 100
isOdd(a)
isOdd(b)

// 2 пункт Написать функцию, которая определяет, делится ли число без остатка на 3

func isDivByThree (_ a: Int) -> Bool{
    if a%3 == 0 {
        return true
    } else {
        return false
    }
}
isDivByThree(a)
isDivByThree(b)

// 3 пункт Создать возрастающий массив из 100 чисел

func makeArr100 () -> Array<Int>{
    var arr = Array<Int>()
    for i in 1...100{
        arr.append(i)
    }
    return arr
}

var arr = makeArr100()

// 4 пункт Удалить из этого массива все четные числа и все числа, которые не делятся на 3

for i in arr {
    if (isOdd(i)) || (isDivByThree(i)){
        arr.remove(at: arr.firstIndex(of: i)!)
        print(i)
    }
}
arr

// 5 пункт Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2

func f (_ arr: inout Array<Int>) -> Array<Int>{
    if arr.isEmpty{
        arr.append(0)
    } else if arr.count == 1{
        arr.append(1)
    } else {
        arr.append(arr[arr.count-1]+arr[arr.count-2])
    }
    return arr
}

var arr2 = Array<Int>()
for _ in 1...50{
    f(&arr2)
}

arr2

/* 6 пункт Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно*/

var arr3 = Array (2...100)
var p = 2

for ar in arr3{
    if ar >= p {
        p = ar
        for i in stride(from: p, through: arr3[arr3.count-1], by: p){
            if let op = arr3.firstIndex(of: (i+p)){
            arr3.remove(at: op)
            }
        }
    }
}

arr3



