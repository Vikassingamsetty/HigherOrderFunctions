import UIKit

extension Array {
    
    // Map
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self {
            // this will get 23 then subtracts 8 hence return 15
            let transformedElement = transform(element)
            result.append(transformedElement)
        }
        return result
    }
    
    // Compact Map
    func customCompactMap<T>(_ transform: (Element) -> T?) -> [T] {
        var result = [T]()
        for element in self {
            if let transformedElement = transform(element) {
                result.append(transformedElement)
            }
        }
        return result
    }
    
    // Flat Map
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        for element in self {
            result.append(contentsOf: transform(element))
        }
        return result
    }
}

// Consuming Map functionality
let mapArray = [23, 43, 56, 75, 9, 14, 25]
let customMap = mapArray.customMap { $0 - 8 }
debugPrint("Map: ", customMap)

// Consuming Compact Map functionality
let compactMapArray = [23, 43, 56, nil, 75, 9, 14]
let result = compactMapArray.customCompactMap { $0 }
debugPrint("Compact Map: ", result)

// Consuming Falt Map functionality
let arrayOfArrays = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let transformedArray = arrayOfArrays.customFlatMap { $0 }
print("Flat Map: ", transformedArray)
