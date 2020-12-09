import UIKit

enum ModelF{
    case SuperFast812
    case F8Tributo
    case GTC4Lusso
    case Portofino
}

enum BrandT{
    case Volvo
    case Mercedes

}

enum Action{
    case IncreaseSpeed
    case MaxSpeed
    case BootGoods
    case GoInForest
}

protocol Car{
    var year: Int {get}
    var bootVolume: Int {get}
    var currentBootVolume: Int {get set}
    var isEngineStart: Bool {get set}
    var isWOpen: Bool {get set}
    var busyBootVolume: Int {get}
    
    mutating func action (action: Action)
}

extension Car {
    mutating func openWindow(){}
    mutating func startEngine(){}
}

class SportСar{
    var year: Int
    var bootVolume: Int
    var currentBootVolume: Int
    var isEngineStart: Bool
    var isWOpen: Bool
    var busyBootVolume: Int
    let model: ModelF
    var currentSpeed: Int = 0
    static let maxSpeed: Int = 300

    init (year: Int, bootVolume: Int, currentBootVolume: Int, isEngineStart: Bool, isWOpen: Bool, busyBootVolume: Int, model: ModelF){
        
        self.year = year
        self.bootVolume = bootVolume
        self.currentBootVolume = currentBootVolume
        self.isEngineStart = isEngineStart
        self.isWOpen = isWOpen
        self.busyBootVolume = busyBootVolume
        self.model = model
        }
}

extension SportСar: Car{
    func action (action: Action){
        switch action {
        case .IncreaseSpeed:
            if self.currentSpeed < (SportСar.maxSpeed - 50) {self.currentSpeed += 50
            } else { self.currentSpeed = SportСar.maxSpeed
        }
        print ("\(description) едет со скоростью \(currentSpeed). Держитесь крепче!")
        case .MaxSpeed: self.currentSpeed = SportСar.maxSpeed
        print ("\(description) едет со скоростью \(currentSpeed). Держитесь крепче!")
        default: print("\(description) умеет только быстро ездить по дорогам и не может ничего перевозить")
        }
    }
    
    func openWindow() {
        isWOpen = true
    }
    
    func startEngine() {
        isEngineStart = true
    }
}

extension SportСar: CustomStringConvertible{
    var description: String {
        return String(describing: "Спорткар \(self.model) год выпуска \(year)")
        }
    }
    

class TrunkCar {
    var year: Int
    var bootVolume: Int
    var currentBootVolume: Int
    var isEngineStart: Bool
    var isWOpen: Bool
    var busyBootVolume: Int
    let brand: BrandT
    let hasUnRoadWheels: Bool
    
    init (year: Int, bootVolume: Int, currentBootVolume: Int, isEngineStart: Bool, isWOpen: Bool, busyBootVolume: Int, brand: BrandT, hasUnRoadWheels: Bool){
        self.year = year
        self.bootVolume = bootVolume
        self.currentBootVolume = currentBootVolume
        self.isEngineStart = isEngineStart
        self.isWOpen = isWOpen
        self.busyBootVolume = busyBootVolume
        self.brand = brand
        self.hasUnRoadWheels = hasUnRoadWheels
        }
    }

extension TrunkCar: Car{
    func action (action: Action){
        switch action {
        case .BootGoods:
            if currentBootVolume == bootVolume {
            currentBootVolume = busyBootVolume
            print("Товары погружены в кузов, заполненный объем \(self.currentBootVolume)")
        } else {
            print("Кузов заполнен, товары не могут быть погружены, заполненный объем \(self.currentBootVolume)")
        }
        case .GoInForest: if hasUnRoadWheels {
            print("\(description) едет по лесу... Птички поют")
        } else {
            print("Чтобы ехать по лесу нужны специальные колеса, у \(description) их нет")
            }
        default: print ("\(description) не умеет быстро ездить")
        }
    }
    
    func openWindow() {
        isWOpen = true
    }
    
    func startEngine() {
        isEngineStart = true
    }
}

extension TrunkCar: CustomStringConvertible{
var description: String {
    return String(describing: "Грузовик \(self.brand) год выпуска \(year)")
    }
}

var sport1 = SportСar (year: 2020, bootVolume: 100, currentBootVolume: 100, isEngineStart: false, isWOpen: false, busyBootVolume: 200, model: .F8Tributo)
var trunk1 = TrunkCar(year: 2000, bootVolume: 2000, currentBootVolume: 2000, isEngineStart: false, isWOpen: false, busyBootVolume: 4000, brand: .Mercedes, hasUnRoadWheels: true)
var trunk2 = TrunkCar(year: 2010, bootVolume: 2000, currentBootVolume: 2000, isEngineStart: true, isWOpen: false, busyBootVolume: 4000, brand: .Volvo, hasUnRoadWheels: false)

print(sport1.description)
sport1.isWOpen
sport1.isEngineStart
sport1.openWindow()
sport1.startEngine()
sport1.isWOpen
sport1.isEngineStart
sport1.action(action: .IncreaseSpeed)
sport1.action(action: .MaxSpeed)
print(trunk1.description)
trunk1.action(action: .BootGoods)
trunk1.action(action: .GoInForest)
print(trunk2.description)
trunk2.action(action: .BootGoods)
trunk2.action(action: .GoInForest)
