//
//  VolumeUtil.swift
//  ConversionWrapper
//
//  Created by CHOIJUNHYUK on 5/10/24.
//

import Foundation

func calculateVolume(value: String, from: String, to: String) -> Double {
    if from == "Milliliters" {
        switch to {
        case "Liters":
            if let value = Double(value) {
                let output = value / 1000
                return output
            }
        case "Cups":
            if let value = Double(value) {
                let output = value / 240
                return output
            }
        case "Pints":
            if let value = Double(value) {
                let output = value / 473.2
                return output
            }
        case "Gallons":
            if let value = Double(value) {
                let output = value / 3785
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Liters" {
        switch to {
        case "Milliliters":
            if let value = Double(value) {
                let output = value * 1000
                return output
            }
        case "Cups":
            if let value = Double(value) {
                let output = value * 4.167
                return output
            }
        case "Pints":
            if let value = Double(value) {
                let output = value * 2.113
                return output
            }
        case "Gallons":
            if let value = Double(value) {
                let output = value / 3.785
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Cups" {
        switch to {
        case "Milliliters":
            if let value = Double(value) {
                let output = value * 240
                return output
            }
        case "Liters":
            if let value = Double(value) {
                let output = value / 4.167
                return output
            }
        case "Pints":
            if let value = Double(value) {
                let output = value / 1.972
                return output
            }
        case "Gallons":
            if let value = Double(value) {
                let output = value / 15.772
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Pints" {
        switch to {
        case "Milliliters":
            if let value = Double(value) {
                let output = value * 473.2
                return output
            }
        case "Liters":
            if let value = Double(value) {
                let output = value / 2.113
                return output
            }
        case "Cups":
            if let value = Double(value) {
                let output = value * 1.972
                return output
            }
        case "Gallons":
            if let value = Double(value) {
                let output = value / 8
                return output
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Gallons" {
        switch to {
        case "Milliliters":
            if let value = Double(value) {
                let output = value * 3785
                return output
            }
        case "Liters":
            if let value = Double(value) {
                let output = value * 3.785
                return output
            }
        case "Cups":
            if let value = Double(value) {
                let output = value * 15.773
                return output
            }
        case "Pints":
            if let value = Double(value) {
                let output = value * 8
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
