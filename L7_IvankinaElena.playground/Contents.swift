import UIKit

enum TypeClothe{
    case Trousers
    case TShort
    case Dress
}

enum Size{
    case XS
    case S
    case M
    case L
}

enum ClothesStoreErrors: Error{
    case noClotheInStore
    case noSize
    case notEnoughMoney
}

class Clothes{
    var type: TypeClothe
    var size: Size
    var availableCount: Int
    var price: Int
    
    init (type: TypeClothe, size: Size, avCount: Int, price: Int){
        self.type = type
        self.size = size
        self.availableCount = avCount
        self.price = price
    }
    
}

class ClothesStore{
    var clothes: [Clothes] = []
    
    init (clothes: [Clothes]){
        self.clothes = clothes
    }
    
    func sellClothe(person: Person, clotheType: TypeClothe) throws {
        guard !clothes.isEmpty else{
            throw ClothesStoreErrors.noClotheInStore
        }
        var countOfSize: Int = 0
        var price: Int = 0
        
        for clothe1 in clothes{
            if clothe1.type == clotheType && clothe1.size == person.size && clothe1.availableCount > 0 {
                countOfSize = clothe1.availableCount
                price = clothe1.price
                
                if clothe1.price <= person.moneyInWallet{
                clothe1.availableCount -= 1
                person.moneyInWallet -= clothe1.price
                print ("Покупатель \(person.name) купил \(clothe1.type) размер \(clothe1.size).")
                print ("Покупатель \(person.name) остаток денег \(person.moneyInWallet)")
                print ("\(clothe1.type) размер \(clothe1.size) остаток в магазине \(clothe1.availableCount)")
                }
            }
        }
        
        guard countOfSize > 0 else{
            throw ClothesStoreErrors.noSize
        }
        guard price <= person.moneyInWallet else {
            throw ClothesStoreErrors.notEnoughMoney
        }
        
    }
    
    func askForAvailable (clotheType: TypeClothe, size: Size) throws -> Clothes{
        var hasClothe = false
        for clothe1 in clothes{
            if clothe1.type == clotheType && clothe1.size == size{
                hasClothe = true
                return clothe1
            }
        }
        guard hasClothe else {
            throw ClothesStoreErrors.noSize
        }
    }
    
    
}

class Person{
    var name: String
    var size: Size
    var moneyInWallet: Int
    
    init(name: String, size: Size, mW: Int){
        self.name = name
        self.size = size
        self.moneyInWallet = mW
    }
}

var person1 = Person(name: "Иванова Лариса", size: .L, mW: 4000)
var person2 = Person(name: "Касьянова Марина", size: .XS, mW: 10000)
var person3 = Person(name: "Капитанов Иван", size: .M, mW: 1000)
var clothe1 = Clothes(type: .Dress, size: .S, avCount: 4, price: 2000)
var clothe2 = Clothes(type: .Dress, size: .M, avCount: 2, price: 2000)
var clothe3 = Clothes(type: .Dress, size: .L, avCount: 1, price: 2000)
var clothe4 = Clothes(type: .Trousers, size: .S, avCount: 4, price: 5000)
var clothe5 = Clothes(type: .TShort, size: .M, avCount: 2, price: 3000)
var clotheStore1 = ClothesStore(clothes: [clothe1, clothe2, clothe3, clothe4, clothe5])
var clotheStore2 = ClothesStore(clothes: [])

do {
    try clotheStore2.sellClothe(person: person3, clotheType: .TShort)
} catch ClothesStoreErrors.noClotheInStore{
    print ("В магазине пока нет товара")
} catch ClothesStoreErrors.noSize{
    print ("Нет подходящего размера или товара")
} catch ClothesStoreErrors.notEnoughMoney{
    print ("У покупателя недостаточно денег для покупки")
}

do {
    try clotheStore1.sellClothe(person: person3, clotheType: .TShort)
} catch ClothesStoreErrors.noClotheInStore{
    print ("В магазине пока нет товара")
} catch ClothesStoreErrors.noSize{
    print ("Нет подходящего размера или товара")
} catch ClothesStoreErrors.notEnoughMoney{
    print ("У покупателя недостаточно денег для покупки")
}

do {
    try clotheStore1.sellClothe(person: person2, clotheType: .Dress)
} catch ClothesStoreErrors.noClotheInStore{
    print ("В магазине пока нет товара")
} catch ClothesStoreErrors.noSize{
    print ("Нет подходящего размера или товара")
} catch ClothesStoreErrors.notEnoughMoney{
    print ("У покупателя недостаточно денег для покупки")
}

do {
    try clotheStore1.sellClothe(person: person1, clotheType: .Dress)
} catch ClothesStoreErrors.noClotheInStore{
    print ("В магазине пока нет товара")
} catch ClothesStoreErrors.noSize{
    print ("Нет подходящего размера или товара")
} catch ClothesStoreErrors.notEnoughMoney{
    print ("У покупателя недостаточно денег для покупки")
}

do {
    try clotheStore1.askForAvailable(clotheType: .Trousers, size: .XS)
} catch ClothesStoreErrors.noSize{
    print ("Нет в наличии")
}

do {
    try clotheStore1.askForAvailable(clotheType: .Trousers, size: .S)
} catch ClothesStoreErrors.noSize{
    print ("Нет в наличии")
}

