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
    case ChangeEngine
    case ChangeWindow
    case BootGoods
}

struct Ferrari{
    let model: ModelF
    let year: Int
    let bootVolume: Int
    var currentBootVolume: Int
    var isEngineStart: Bool
    var isWOpen: Bool
    var busyBootVolume: Int
    
    mutating func action (action: Action){
        switch action {
        case .ChangeEngine: if isEngineStart {
            isEngineStart = false
        } else {
            isEngineStart = true
            }
        case .ChangeWindow: if isWOpen {
                isWOpen = false
            } else {
                isWOpen = true
                }
        case .BootGoods: if currentBootVolume == busyBootVolume {
                currentBootVolume = bootVolume
            } else {
                currentBootVolume = busyBootVolume
                }
        }
    }
}

struct Trunc{
    let brand: BrandT
    let year: Int
    let bootVolume: Int
    var currentBootVolume: Int
    var isEngineStart: Bool
    var isWOpen: Bool
    var busyBootVolume: Int
    
    mutating func action (action: Action){
        switch action {
        case .ChangeEngine: if isEngineStart {
            isEngineStart = false
        } else {
            isEngineStart = true
            }
        case .ChangeWindow: if isWOpen {
                isWOpen = false
            } else {
                isWOpen = true
                }
        case .BootGoods: if currentBootVolume == busyBootVolume {
                currentBootVolume = bootVolume
            } else {
                currentBootVolume = busyBootVolume
                }
        }
    }
}

var portofino = Ferrari(model: .Portofino, year: 2020, bootVolume: 100, currentBootVolume: 100, isEngineStart: false, isWOpen: false, busyBootVolume: 150)
var superfast812 = Ferrari(model: .SuperFast812, year: 2019, bootVolume: 80, currentBootVolume: 80, isEngineStart: true, isWOpen: true, busyBootVolume: 100)
var volvoTrunk = Trunc(brand: .Volvo, year: 2000, bootVolume: 500, currentBootVolume: 500, isEngineStart: true, isWOpen: false, busyBootVolume: 1500)

print(volvoTrunk.currentBootVolume)
print(volvoTrunk.isWOpen)
print(volvoTrunk.isEngineStart)
volvoTrunk.action(action: .BootGoods)
volvoTrunk.action(action: .ChangeWindow)
volvoTrunk.action(action: .ChangeEngine)
print(volvoTrunk.currentBootVolume)
print(volvoTrunk.isWOpen)
print(volvoTrunk.isEngineStart)

print(portofino.currentBootVolume)
print(portofino.isWOpen)
print(portofino.isEngineStart)
portofino.action(action: .BootGoods)
portofino.action(action: .ChangeWindow)
portofino.action(action: .ChangeEngine)
print(portofino.currentBootVolume)
print(portofino.isWOpen)
print(portofino.isEngineStart)

print(superfast812.currentBootVolume)
print(superfast812.isWOpen)
print(superfast812.isEngineStart)
superfast812.action(action: .BootGoods)
superfast812.action(action: .ChangeWindow)
superfast812.action(action: .ChangeEngine)
print(superfast812.currentBootVolume)
print(superfast812.isWOpen)
print(superfast812.isEngineStart)
