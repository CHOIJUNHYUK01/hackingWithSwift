//
//  TempsUtil.swift
//  ConversionWrapper
//
//  Created by CHOIJUNHYUK on 5/10/24.
//

import Foundation

func calculateTemps(value: String, from: String, to: String, sign: String) -> Double {
    guard let standardValue = Double(value) else {return 0}
    var adjustedValue: Double {
        if sign == "Positive" { return standardValue }
        else { return standardValue * -1 }
    }
    
    if from == "Celsius" {
        switch to {
        case "Fahreheit":
            return adjustedValue * 9 / 5 + 32
        case "Kelvin":
            return adjustedValue + 273.15
        default:
            return adjustedValue
        }
    }
    
    if from == "Fahreheit" {
        switch to {
        case "Celsius":
            return (adjustedValue - 32) * 5 / 9
        case "Kelvin":
            return (adjustedValue - 32) * 5 / 9 + 273.15
        default:
            return adjustedValue
        }
    }
    
    if from == "Kelvin" {
        switch to {
        case "Celsius":
            return adjustedValue - 327.15
        case "Fahreheit":
            return (adjustedValue - 327.15) * 9 / 5 + 32
        default:
            return adjustedValue
        }
    }
    
    return 0
}
