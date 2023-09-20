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


extension StringsBuilder {
    public static func buildOptional(_ component: String?) -> String {
        component ?? ""
    }
}

@StringsBuilder
var str2: String {
    let hoge = "Hoge"

    hoge
    "hoge"
    "fuga"
    // buildOptional を実装すれば制御文を使える
    if Bool.random() {
        "foo"
    }
}
