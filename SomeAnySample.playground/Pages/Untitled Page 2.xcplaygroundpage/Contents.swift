
import UIKit

var greeting = "Hello, playground"


protocol Animal {
    func bark()
}

class Dog: Animal {

    func bark() {
        print("wan")
    }
    func bite() {}
}

class Cat: Animal {
    func bark() {
        print("nya-")
    }
    func scratch() {}
}

// ----- some -----

//
//func foo<T: Animal>(anAnimal: T) -> T {
//    return anAnimal
//}
func foo(anAnimal: some Animal) -> some Animal {
    return anAnimal
}

// このような関数はできない
//func someAnimal(n: Int) -> some Animal {
//    if n == 0 {
//        return Dog()
//    } else {
//        return Cat()
//    }
//}

// 上記は以下と同義であり、Tという一つの型を返す定義であるため
//func someAnimal<T: Animal>(n: Int) -> T {
//    if n == 0 {
//        return Dog()
//    } else {
//        return Cat()
//    }
//}






// ----- any -----

//func hoge(anAnimal: Animal) -> Animal {
//    return anAnimal
//}

func hoge(anAnimal: Animal) -> any Animal {
    return anAnimal
}





let dog = Dog()
let cat = Cat()
let animal: any Animal = Bool.random() ? dog : cat

// プロトコルを型として扱うと、メモリを余分に使ってしまう
print(MemoryLayout.size(ofValue: dog)) // 8 byte
print(MemoryLayout.size(ofValue: cat)) // 8 bytes
print(MemoryLayout.size(ofValue: animal)) // 40 bytes
