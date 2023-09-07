import UIKit

var greeting = "Hello, playground"



let calendar = Calendar(identifier: .gregorian)
var dateComponents = calendar.dateComponents(in: TimeZone.current, from: Date())
var dateComponentsTokyo = calendar.dateComponents(in: TimeZone(identifier: "Asia/Tokyo")!, from: Date())
var dateComponentsCurrent = Calendar.current.dateComponents(in: TimeZone(identifier: "Asia/Tokyo")!, from: Date())
var dateComponentsList = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date())

//print(TimeZone.current)
//print(dateComponents.date)
//print(dateComponentsTokyo.timeZone)
//print(dateComponentsTokyo.date)
//print(dateComponentsCurrent.timeZone)
//print(dateComponentsCurrent.date)
//print(dateComponentsList.timeZone)
//print(Calendar.current.date(from: dateComponentsList))
//print()

dateComponents.hour = 12
dateComponents.minute = 12

dateComponentsTokyo.hour = 11
dateComponentsTokyo.minute = 11

dateComponentsCurrent.hour = 10
dateComponentsCurrent.minute = 10
//
//print(dateComponents.date)
//print(dateComponentsTokyo.date)
//print(dateComponentsCurrent.date)
//


// Date を時間指定で作成

func date(h: Int, m: Int, s: Int) -> Date {
    var dateCom = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
    dateCom.hour = h
    dateCom.minute = m
    dateCom.second = s
    print(dateCom.date)
    return dateCom.date!
}

// Date 比較

let businessHour = date(h: 8, m: 30, s: 0)..<date(h: 16, m: 15, s: 0)
print(businessHour)
let date1 = date(h: 8, m: 29, s: 0)
let date2 = date(h: 8, m: 30, s: 0)
let date3 = date(h: 16, m: 14, s: 0)
let date4 = date(h: 16, m: 15, s: 0)

print(businessHour.contains(date1))    //false
print(businessHour.contains(date2))    //true
print(businessHour.contains(date3))    //true
print(businessHour.contains(date4))    //false


print("\n演算")
print(date(h: 12, m: 12, s: 12) + 1)    // 1秒加算
print(date(h: 12, m: 12, s: 12) + 60)    // 1分加算
print(date(h: 12, m: 12, s: 12) + (60 * 60))    // 1時間加算



print("\n日本時間で表示")

let jpDateFmt = DateFormatter()

// string(from:),
//
// 地点の指定
jpDateFmt.timeZone = TimeZone(identifier: "America/Los_Angeles")    // ロス時間で表示
//jpDateFmt.timeZone = TimeZone(identifier: "Asia/Tokyo") //日本時間で表示

// フォーマット（表示内容）の指定
// 指定がなければ表示は空文字
//jpDateFmt.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
//jpDateFmt.dateFormat = "HH:mm:ss"
jpDateFmt.dateStyle = .full
jpDateFmt.timeStyle = .full

print(jpDateFmt.timeStyle.rawValue)
print(jpDateFmt.string(from: Date()))
print(jpDateFmt.string(from: Date()))

// フォーマット（地域）の指定
jpDateFmt.locale = Locale(identifier: "en_US")  //アメリカフォーマットで表示
//jpDateFmt.locale = Locale(identifier: "jp_JP")
print(jpDateFmt.timeStyle.rawValue)

// Stringに変換
print(jpDateFmt.string(from: Date()))



print("\n  カレンダー")
let indianCal = Calendar(identifier: .indian) // 暦を指定してイニシャライズ
let comp = indianCal.dateComponents([.month, .day, .hour, .minute], from: Date())
print(comp) //インド暦で現在日時を表示（日本時間）

let currentCal = Calendar.current
var currentComp = currentCal.dateComponents(in: TimeZone.current, from: Date())
print(currentComp) // 日本歴で現在日時を表示（日本時間）

print(indianCal.minimumDaysInFirstWeek)
print(currentCal.nextWeekend(startingAfter: Date()))


// 東京タイムゾーンで作成されたため、dateはタイムゾーンが考慮される
// 現在は東京なので -9時間
print(currentComp.timeZone)
print(currentComp.date)
// 世界標準時刻にすればプロパティの値のままでdateになる
currentComp.timeZone = TimeZone.gmt
print(currentComp.date)
