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
        performRequest(TheURL: urlString)
    }
    
    //performing a request
    func performRequest(TheURL: String ){
        //1.) creating URL
        if let url = URL(string: TheURL) {
            
            //2.) Creating a URLSession "like the jason file that we see in chrome"
            let session = URLSession(configuration: .default)
            
            /*3.) Give the session a task "this will creates a task that retrieves the contents of URL, then call a handler upon completion"
                  it goes to the url and grap the data */
            let task = session.dataTask(with: url, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
            
            //4.) start the task "you need to call this method to start the task."
            task.resume()
        }
    }
}
