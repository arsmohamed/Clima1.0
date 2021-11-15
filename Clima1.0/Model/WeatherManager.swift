//
//  WeatherManager.swift
//  Clima1.0
//
//  Created by Mero on 2021-11-08.
//

import Foundation

struct WeatherManager {

//MARK: - getting the lat and long
    //creating the url
    func featchGeoCode(cityname: String) {
        let GeoCode = "https://api.mapbox.com/geocoding/v5/mapbox.places/,\(cityname).json?access_token=pk.eyJ1IjoiYXJzbW9oYW1lZCIsImEiOiJja2JydDBqZHcyNWx2MnJ0bW54d2kwOWtnIn0.jFqMm_liVWqdB7QKOa2uig&limit=1"
        print(GeoCode)
        GeoCodeRequest(GeoCodeUrl: GeoCode)
    }
    
    //parsing the url and looking into the jason
    func GeoCodeRequest ( GeoCodeUrl: String) {
        // 1. Creating URL
        if let geocodeUrl = URL(string: GeoCodeUrl) {
            // 2. Creating Session
            let GeoCodeSession = URLSession(configuration: .default)
            // 2. creating Task
            let GeoCodetask = GeoCodeSession.dataTask(with: geocodeUrl, completionHandler: GeoCodeSessionHandler(geocodeData: geocodeResponse: geocodeError:))
            // 3. start the task
            GeoCodetask.resume()
        }
    }
    
    //A GeoCode func that will take all the input data that the session will retrive from optional data, optional URLResponse, option Error because of "?"
    func GeoCodeSessionHandler (geocodeData: Data?, geocodeResponse: URLResponse?, geocodeError: Error?) {
        //Checking for error
        if geocodeError != nil {
            print(geocodeError!)
            return
        }
        
        //no error
        if let recievedGeoCodeData = geocodeData {
            //converting the recieved data to string
            let GeoCodeDataString = String(data: recievedGeoCodeData, encoding: .utf8)
            print("GeoCode")
            print(GeoCodeDataString)
        }
    }
    
//MARK: -  Weather URL
    //let weatherURL =    "https://api.openweathermap.org/data/2.5/onecall?appid=a61085bb415c06e8a8f7a4d1735dd811&exclude=minutely&units=metric"
    
    let weatherURL =    "https://api.openweathermap.org/data/2.5/weather?appid=a61085bb415c06e8a8f7a4d1735dd811&exclude=minutely&units=metric"
    //&lat=51.509865&lon=-0.118092
   
    //city name as input
    func featchWeather(cityname: String) {
        let WeatherurlString = "\(weatherURL)&q=\(cityname)"
        print(WeatherurlString)
        performRequest(TheURL: WeatherurlString)
    }
    
    //performing a request
    func performRequest(TheURL: String ){
        //1.) creating URL
        if let WeatherUrl = URL(string: TheURL) {
            
            //2.) Creating a URLSession "like the jason file that we see in chrome"
            let session = URLSession(configuration: .default)
            
            /*3.) Give the session a task "this will creates a task that retrieves the contents of URL, then call a handler upon completion"
                  it goes to the url and grap the data
                  -> passing in a call sessionHandler and each input I am not passing values because the completionHandler will be tergered by the task
             */
            let task = session.dataTask(with: WeatherUrl, completionHandler: sessionHandler(data: response: error:))
            
            //4.) start the task "you need to call this method to start the task."
            task.resume()
        }
    }
    
    //A func that will take all the input data that the session will retrive from optional data, optional URLResponse, option Error because of "?"
    func sessionHandler(data: Data?, response: URLResponse?, error: Error?){
        //checking if there is an error
        if error != nil {
            print("Error:- \(error!)")
            return
        }
        
        // if there is no errors
        if let recievedData = data {
             // 1.) converting the recieved data into a string using the initializer to take the data and encode it using utf8
            let dataString = String(data: recievedData, encoding: .utf8)
            print("dataString")
            print(dataString)
        }
        
    }
}
