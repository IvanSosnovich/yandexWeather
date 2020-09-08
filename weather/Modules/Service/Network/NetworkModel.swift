//
//  NetworkModel.swift
//  weather
//
//  Created by MIkkyMouse on 07.09.2020.
//  Copyright © 2020 Ivan Sosnovich. All rights reserved.
//

import Foundation


struct CityWeather: Decodable {
    var info: Info
    var fact: Fact
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case fact = "fact"
    }
}

struct Info: Decodable {
    var tzinfo: TzInfo
    var url: String
    
    struct TzInfo: Decodable {
        var name: String
    }
}

struct Fact: Decodable {
    var temp: Double
    var icon: String
}

struct CitiesName {
    var lat: Double
    var lon: Double
}

struct CityData {
    var name: String
    var airTemperature: Double
    var url: String
    var imageWeather: Data
}
