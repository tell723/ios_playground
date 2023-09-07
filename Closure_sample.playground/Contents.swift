import UIKit

var greeting = "Hello, playground"

// 基本的に関数は同じ引数を受け取ったら同じ結果を返します

func sum(a: Int, b: Int) -> Int {
    return a + b
}
print(sum(a: 2, b: 2))
print(sum(a: 2, b: 2))
print(sum(a: 2, b: 2))




// getTotalFunc を抜けると total
func getTotalFunc() -> (Int) -> Int {
    var total = 0
    return { (n: Int) in
        total += n
        return total
    }
}

var total = getTotalFunc()
print(total(5)) // -> 5
print(total(5)) // -> 10
print(total(5)) // -> 15



class WebAPI {
    func fetchStr(onComplete: @escaping (SomeData) -> () ) {
        // ... REST API でデータを取得する処理
    }
}

class SomeData {
    var value = ""
}

class SimpleClass {
    var str = ""
    func setStr() {
        WebAPI().fetchStr(onComplete: { [weak self] fetchedData in
            guard let wSelf = self else { return }
            wSelf.str = fetchedData.value
        })
    }
}
