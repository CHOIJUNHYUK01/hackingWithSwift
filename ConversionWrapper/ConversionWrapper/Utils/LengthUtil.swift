//
//  LengthUtil.swift
//  ConversionWrapper
//
//  Created by CHOIJUNHYUK on 5/10/24.
//

import Foundation

func calculateLength(value: String, from: String, to: String) -> Double {
    if from == "Meters" {
        switch to {
        case "Kilometers":
            if let value = Double(value) {
                let output = value / 1000
                return output
            }
        case "Feet":
            if let value = Double(value) {
                let output = value * 3.281
                return output
            }
        case "Yards":
            if let value = Double(value) {
                let output = value * 1.094
                return output
            }
        case "Miles":
            if let value = Double(value) {
                let output = value / 1609
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Kilometers" {
        switch to {
        case "Meters":
            if let value = Double(value) {
                let output = value * 1000
                return output
            }
        case "Feet":
            if let value = Double(value) {
                let output = value * 1000 / 1609
                return output
            }
        case "Yards":
            if let value = Double(value) {
                let output = value * 1000 / 1609
                return output
            }
        case "Miles":
            if let value = Double(value) {
                let output = value * 1000 / 1609
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Feet" {
        switch to {
        case "Meters":
            if let value = Double(value) {
                let output = value / 3.281
                return output
            }
        case "Kilometers":
            if let value = Double(value) {
                let output = value / 3281
                return output
            }
        case "Yards":
            if let value = Double(value) {
                let output = value / 3
                return output
            }
        case "Miles":
            if let value = Double(value) {
                let output = value / 5280
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Yards" {
        switch to {
        case "Meters":
            if let value = Double(value) {
                let output = value / 1.094
                return output
            }
        case "Kilometers":
            if let value = Double(value) {
                let output = value / 1094
                return output
            }
        case "Feet":
            if let value = Double(value) {
                let output = value * 3
                return output
            }
        case "Miles":
            if let value = Double(value) {
                let output = value / 1760
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Miles" {
        switch to {
        case "Meters":
            if let value = Double(value) {
                let output = value * 1609
                return output
            }
        case "Kilometers":
            if let value = Double(value) {
                let output = value * 1.609
                return output
            }
        case "Feet":
            if let value = Double(value) {
                let output = value * 5280
                return output
            }
        case "Yards":
            if let value = Double(value) {
                let output = value * 1760
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    return 0
}
