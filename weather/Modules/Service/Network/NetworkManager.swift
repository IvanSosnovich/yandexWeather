//
//  NetworkManager.swift
//  weather
//
//  Created by MIkkyMouse on 07.09.2020.
//  Copyright © 2020 Ivan Sosnovich. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    
    func gettingWeather(for latitude: Double, longitud: Double, completion: @escaping(_ cityData: CityWeather?, _ error: Error?) -> Void)
    
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {}
    
    func gettingWeather(for latitude: Double, longitud: Double, completion: @escaping (CityWeather?, Error?) -> Void) {
       
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?") else { return }
        
        let parametrs: [String: String] = [
            "lat": "\(latitude)",
            "lon": "\(longitud)",
            "lang": "ru_RU",
            "hours": "\(true)"
        ]
        
        let headders: HTTPHeaders = [
            "X-Yandex-API-Key": "5697694b-f0cc-457a-a0b5-806d7c6d655a"
        ]
        
        AF.request(url, parameters: parametrs, headers: headders).responseDecodable(of: CityWeather.self) { (response) in
            if response.value == nil {
                completion(nil, response.error)
            }
            guard let cityWeather = response.value else { return }
            completion(cityWeather, nil)
        }
            
        }
    }
    
    /*func gettingWeather(for latitude: Double, longitud: Double, completion: @escaping (CityWeather?, Error?) -> Void) {
        
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.weather.yandex.ru"
        urlConstructor.path = "/v2/forecast"
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitud)"),
            URLQueryItem(name: "lang", value: "ru_RU"),
            URLQueryItem(name: "hours", value: "\(true)")
        ]
        
        
        guard let baseURL = urlConstructor.url else { return }
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.setValue("5697694b-f0cc-457a-a0b5-806d7c6d655a", forHTTPHeaderField: "X-Yandex-API-Key" )
        DispatchQueue.main.async {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let cityData = try JSONDecoder().decode(CityWeather.self, from: data)
                completion(cityData, nil)
            }
            catch let error {
                print(error)
                completion(nil, error)
            }
        }.resume()
    }
    }
 */


