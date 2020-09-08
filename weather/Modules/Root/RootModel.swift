//
//  RootModel.swift
//  weather
//
//  Created by MIkkyMouse on 08.09.2020.
//  Copyright © 2020 Ivan Sosnovich. All rights reserved.
//

import Foundation
class RootModel {
    
    static let shared = RootModel()
    private init() {}
    
    let citiesName = [
        CitiesName(lat: 55.7522, lon: 37.6156),
        CitiesName(lat: 46.3497, lon: 48.0408),
        CitiesName(lat: 53.3606, lon: 83.7636),
        CitiesName(lat: 53.2521, lon: 34.3717),
        CitiesName(lat: 43.1056, lon: 131.874),
        CitiesName(lat: 54.6269, lon: 39.6916),
        CitiesName(lat: 53.2001, lon: 50.15),
        CitiesName(lat: 59.9386, lon: 30.3141),
        CitiesName(lat: 51.5406, lon: 46.0086),
        CitiesName(lat: 56.0184, lon: 92.8672)
    ]
    
   
}
