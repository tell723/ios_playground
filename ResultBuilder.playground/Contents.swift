import UIKit


@resultBuilder
public struct StringsBuilder {
    public static func buildBlock(_ components: String...) -> String {
        return components.reduce("", { $0.appending($1) })
    }
}

@StringsBuilder
var str: String {
    // 変数宣言も可能
    let hoge = "Hoge"

    hoge
    "hoge"
    "fuga";"poo"
    "foo"


    let numList = [1,2,3,4,5]
    // 以下のような制御文は使用不可
//    if Bool.random() {
//    } else {
//    }

//    for n in numList {
//        print(n)
//    }
}

print(str) // -> Hogehogefugapoofoo

