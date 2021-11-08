//
//  WeatherManager.swift
//  Clima1.0
//
//  Created by Mero on 2021-11-08.
//

import Foundation

struct WeatherManager {
    let weatherURL =    "https://api.openweathermap.org/data/2.5/onecall?appid=a61085bb415c06e8a8f7a4d1735dd811&exclude=minutely&units=metric"
    //&lat=51.509865&lon=-0.118092
    //city name as input
    func featchWeather(cityname: String) {
        let urlString = "\(weatherURL)&q=\(cityname)"
        print(urlString)
    }
}
