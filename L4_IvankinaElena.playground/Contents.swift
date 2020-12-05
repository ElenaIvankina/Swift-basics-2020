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

class Car{
    var year: Int
    let bootVolume: Int
    var currentBootVolume: Int
    var isEngineStart: Bool
    var isWOpen: Bool
    var busyBootVolume: Int
    
    init(year: Int, bootVolume: Int, currentBootVolume: Int, isEngineStart: Bool, isWOpen: Bool, busyBootVolume: Int ) {
        self.year = year
        self.bootVolume = bootVolume
        self.currentBootVolume = currentBootVolume
        self.isEngineStart = isEngineStart
        self.isWOpen = isWOpen
        self.busyBootVolume = busyBootVolume
    }
    
    func action (action: Action){
    }
}

class SportСar: Car{
    let model: ModelF
    var currentSpeed: Int = 0
    let maxSpeed: Int = 300

    init (year: Int, bootVolume: Int, currentBootVolume: Int, isEngineStart: Bool, isWOpen: Bool, busyBootVolume: Int, model: ModelF){
        self.model = model
        super.init(year: year, bootVolume: bootVolume, currentBootVolume: currentBootVolume, isEngineStart: isEngineStart, isWOpen: isWOpen, busyBootVolume: busyBootVolume)
    }
    
    override func action (action: Action){
        switch action {
        case .IncreaseSpeed:
        if currentSpeed < (maxSpeed - 50) {currentSpeed += 50
        } else { currentSpeed = maxSpeed
        }
        print ("Спорткар едет со скоростью \(currentSpeed). Держитесь крепче!")
        case .MaxSpeed: currentSpeed = maxSpeed
        print ("Спорткар едет со скоростью \(currentSpeed). Держитесь крепче!")
        default: print("Спорткар умеет только быстро ездить по дорогам и не может ничего перевозить")
        }
    }
}

class TrunkCar: Car{
    let brand: BrandT
    let hasUnRoadWheels: Bool
    
    init (year: Int, bootVolume: Int, currentBootVolume: Int, isEngineStart: Bool, isWOpen: Bool, busyBootVolume: Int, brand: BrandT, hasUnRoadWheels: Bool){
        self.brand = brand
        self.hasUnRoadWheels = hasUnRoadWheels
        super.init(year: year, bootVolume: bootVolume, currentBootVolume: currentBootVolume, isEngineStart: isEngineStart, isWOpen: isWOpen, busyBootVolume: busyBootVolume)
    }
    
    override func action (action: Action){
        switch action {
        case .BootGoods:
            if currentBootVolume == bootVolume {
            currentBootVolume = busyBootVolume
            print("Товары погружены в кузов, заполненный объем \(self.currentBootVolume)")
        } else {
            print("Кузов заполнен, товары не могут быть погружены, заполненный объем \(self.currentBootVolume)")
        }
        case .GoInForest: if hasUnRoadWheels {
            print("Еду по лесу... Птички поют")
        } else {
            print("Чтобы ехать по лесу нужны специальные колеса, у данной машины их нет")
            }
        default: print ("Грузовики не умеют быстро ездить")
        }
    }
    }

var sport1 = SportСar (year: 2020, bootVolume: 100, currentBootVolume: 100, isEngineStart: true, isWOpen: false, busyBootVolume: 200, model: .F8Tributo)
var trunk1 = TrunkCar(year: 2000, bootVolume: 2000, currentBootVolume: 2000, isEngineStart: true, isWOpen: false, busyBootVolume: 4000, brand: .Mercedes, hasUnRoadWheels: true)
var trunk2 = TrunkCar(year: 2000, bootVolume: 2000, currentBootVolume: 2000, isEngineStart: true, isWOpen: false, busyBootVolume: 4000, brand: .Mercedes, hasUnRoadWheels: false)

sport1.action(action: .IncreaseSpeed)
sport1.action(action: .IncreaseSpeed)
sport1.action(action: .MaxSpeed)
sport1.action(action: .IncreaseSpeed)
sport1.action(action: .GoInForest)
sport1.action(action: .BootGoods)
trunk1.action(action: .IncreaseSpeed)
trunk1.action(action: .MaxSpeed)
trunk1.action(action: .BootGoods)
trunk1.action(action: .BootGoods)
trunk1.action(action: .GoInForest)
trunk2.action(action: .GoInForest)

