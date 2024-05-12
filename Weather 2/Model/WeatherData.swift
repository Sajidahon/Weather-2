//
//  WeatherData.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 12.05.2024.
//

import Foundation


struct WeatherData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp:Double;
    let pressure:Int;
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
