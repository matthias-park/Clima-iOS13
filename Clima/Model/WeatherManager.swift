//
//  WeatherManager.swift
//  Clima
//
//  Created by JUNSOO PARK on 2021-11-17.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=625140093fb7680a415d5478a1fd5185&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session work
           let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataSafe = String(data: safeData, encoding: .utf8)
            print(dataSafe)
        }
    }
}
