//
//  TimeUtil.swift
//  ConversionWrapper
//
//  Created by CHOIJUNHYUK on 5/10/24.
//

import Foundation

func calculateTime(value: String, from: String, to: String) -> Double {
    if from == "Seconds" {
        switch to {
        case "Minutes":
            if let value = Double(value) {
                return value / 60
            }
        case "Hours":
            if let value = Double(value) {
                return value / 3600
            }
        case "Days":
            if let value = Double(value) {
                return value / (3600 * 24)
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Minutes" {
        switch to {
        case "Seconds":
            if let value = Double(value) {
                return value * 60
            }
        case "Hours":
            if let value = Double(value) {
                return value / 60
            }
        case "Days":
            if let value = Double(value) {
                return value / (60 * 24)
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Hours" {
        switch to {
        case "Seconds":
            if let value = Double(value) {
                return value * 3600
            }
        case "Minutes":
            if let value = Double(value) {
                return value * 60
            }
        case "Days":
            if let value = Double(value) {
                return value / 24
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    if from == "Days" {
        switch to {
        case "Seconds":
            if let value = Double(value) {
                return value * (24 * 3600)
            }
        case "Minutes":
            if let value = Double(value) {
                return value * (24 * 60)
            }
        case "Hours":
            if let value = Double(value) {
                return value * 24
            }
        default:
            if let value = Double(value) {
                return value
            }
        }
    }
    
    return 0
}
