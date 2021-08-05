import Foundation

/// v1: original. doesn't compile. uncomment to see errors!

//func calculateAverage(values: [Int]) -> Double? {
//    var average = 0.0
//    for _ in values {
//        average += values[$0]
//    }
//    return average / values.count
//}

/// v2: compilation errors fixed
func calculateAverageV2(values: [Int]) -> Double? {
    var sum = 0
    for value in values {
        sum += value
    }
    return Double(sum) / Double(values.count)
}

let v2_average = calculateAverageV2(values: [1, 2, 3]) // returns 2
let v2_averageNan = calculateAverageV2(values: []) // not good! returns NaN


/// v3: fixing NaN, nil instead
func calculateAverageV3(values: [Int]) -> Double? {
    guard !values.isEmpty else {
        return nil
    }
    var sum = 0
    for value in values {
        sum += value
    }
    return Double(sum) / Double(values.count)
}

let v3_average = calculateAverageV3(values: [1, 2, 3]) // returns 2
let v3_averageNan = calculateAverageV3(values: []) // nil

/// v4: using reduce
func calculateAverageV4(values: [Int]) -> Double? {
    guard !values.isEmpty else {
        return nil
    }
    let sum = values.reduce(0, { resultSoFar, next in
        return resultSoFar + next
    })
    return Double(sum) / Double(values.count)
}

let v4_average = calculateAverageV4(values: [1, 2, 3]) // returns 2
let v4_averageNan = calculateAverageV4(values: []) // nil

///v5: improvements on the API: _values_ is redundant
func calculateAverageV5(_ values: [Int]) -> Double? {
    return calculateAverageV4(values: values) // saving the copy-paste :)
}

let v5_average = calculateAverageV5([1, 2, 3]) // returns 2

