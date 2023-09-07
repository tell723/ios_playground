import UIKit

var greeting = "Hello, playground"


enum E: Error {
    case errA
    case errB

}

extension E: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .errA: return "A"
        case .errB: return "B"
        }
    }
}

print(E.errA.localizedDescription)
