import UIKit

protocol WeightableAndHeightable{
    var weight: Int {get}
    var height: Int {get}
}

class Brics: WeightableAndHeightable{
    var height: Int
    var weight: Int
    var build: () -> Void
    
    init(height: Int, weight: Int){
        self.height = height
        self.weight = weight
        self.build = { print ("К строению добавлен кирпич")}
    }
}

class BigBrics: Brics{
    init (){
        super.init(height: 40, weight: 20)
        self.build = { print ("К строению добавлен большой кирпич")}
    }
}

    
class SmallBrics: Brics{
    init (){
        super.init(height: 30, weight: 15)
        self.build = { print ("К строению добавлен малый кирпич")}
    }
}

//Не поняла как сделать поддержку общим типом 2 протоколов, поэтому Вес и Высота в одном протоколе
//struct Tower <T: Weightable, Heightable> - так ругался

struct Tower<T: WeightableAndHeightable>{
    var blocks = [T]()
    var totalWeight: Int = 0
    var totalHeight: Int = 0
    var name: String = "Башня"
    var compareHeight: (Int) -> Bool = {$0 > 500}

    mutating func increaseTheTower (_ element: T, closure: () -> Void){
        blocks.append(element)
        totalWeight += element.weight
        totalHeight += element.height
        closure()
        print("\(name): Высота \(totalHeight). Вес \(totalWeight)")
    }

    mutating func rename (closure: (Int) -> Bool) {
        if closure (self.totalHeight) {
            name = "Высокая башня"
        }
    }
    
    func countBlocks (blocks: [T], closure: (T) -> Bool) -> Int{
        var count = 0
        for block in blocks{
        if closure(block){
            count += 1
        }
        }
        return count
    }
    
    subscript(index: Int) -> T{
         
        get{
            assert(index <= (blocks.count-1), "Такого элемента нет")
            return blocks[index]

        }
        set(newValue){
            assert(index <= (blocks.count-1), "Такого элемента нет")
            blocks[index] = newValue
        }
    }
    
}

var tower1 = Tower<Brics>()
let sm1 = SmallBrics()
let sm2 = SmallBrics()
let bg1 = BigBrics()
let br1 = Brics(height: 300, weight: 100)
let br2 = Brics(height: 150, weight: 120)
let br3 = Brics(height: 100, weight: 120)

tower1.increaseTheTower(sm1, closure: sm1.build)
tower1.increaseTheTower(sm2, closure: sm2.build)
tower1.increaseTheTower(bg1, closure: bg1.build)
tower1.increaseTheTower(br1, closure: br1.build)
tower1.increaseTheTower(br2, closure: br2.build)

tower1[0]
tower1[1]
tower1[2]
tower1[3]
tower1[4]

//не поняла почему нельзя вызвать self.compareHeigh, приходится писать tower1.compareHeight
tower1.rename(closure: tower1.compareHeight)

tower1.increaseTheTower(br3, closure: br3.build)

tower1.countBlocks(blocks: tower1.blocks, closure: {
    (block: Brics) -> Bool in
    return block is SmallBrics
})

tower1.countBlocks(blocks: tower1.blocks, closure: {
    (block: Brics) -> Bool in
    return block is BigBrics
})




