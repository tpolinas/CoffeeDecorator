import UIKit

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost = 0
    
    init(cost: Int) {
        self.cost = cost
    }
}

protocol CoffeeDecorator: Coffee {
    var espresso: Coffee { get }
    
    init(espresso: Coffee)
}

class Milk: CoffeeDecorator {
    var espresso: Coffee
    
    var cost: Int {
        return espresso.cost + 60
    }
    
    required init(espresso: Coffee) {
        self.espresso = espresso
    }
}

class Whip: CoffeeDecorator {
    var espresso: Coffee
    
    var cost: Int {
        return espresso.cost + 30
    }
    
    required init(espresso: Coffee) {
        self.espresso = espresso
    }
}

class Sugar: CoffeeDecorator {
    var espresso: Coffee
    
    var cost: Int {
        return espresso.cost + 20
    }
    
    required init(espresso: Coffee) {
        self.espresso = espresso
    }
}

class MapleSyrup: CoffeeDecorator {
    var espresso: Coffee
    
    var cost: Int {
        return espresso.cost + 80
    }
    
    required init(espresso: Coffee) {
        self.espresso = espresso
    }
}


let espresso = SimpleCoffee(cost: 80)
let cappuccino = Milk(espresso: espresso)
let latte = Milk(espresso: cappuccino)
let mapleLatte = MapleSyrup(espresso: latte)

print(espresso.cost)
print(cappuccino.cost)
print(latte.cost)
print(mapleLatte.cost)
