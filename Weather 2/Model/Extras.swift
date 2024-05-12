//
//  Extras.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 28.04.2024.
//

import Foundation

var API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=7c609f73c5df2dff2f32e3e3cc33cd23&lang=ru"

//let API_URL = "http://api.openweathermap.org/data/3.0/onecall?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=6205d103e912722417488492dd65087d"
var FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=8&appid=7c609f73c5df2dff2f32e3e3cc33cd23&lang=ru"

var location_API_URL = "https://api.openweathermap.org/data/2.5/weather?appid=7c609f73c5df2dff2f32e3e3cc33cd23&units=metric&q="

typealias DownloadComplete = () -> ()

