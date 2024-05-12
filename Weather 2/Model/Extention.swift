//
//  Extention.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 28.04.2024.
//

import Foundation


// MARK: - Rounds the double to decimal places value
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// MARK: - Date Extension to covert date to a day in String type.
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
