//
//  RootViewController.swift
//  weather
//
//  Created by MIkkyMouse on 03.09.2020.
//  Copyright (c) 2020 Ivan Sosnovich. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit



class RootViewController: UIViewController {
    
    let network = NetworkManager.shared
    let rootModel = RootModel.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeather()
        
        
    }
    
    
}

// MARK: Setup
extension RootViewController {
    
    private func loadMain(city: [CityData]) {
        let vc = UIStoryboard(name: "MainView", bundle: nil)
            .instantiateViewController(identifier: "MainView") as! MainViewController
        vc.modalPresentationStyle = .fullScreen
        vc.citiesList = city
        self.present(vc, animated: true)
        
    }
    
    private func loadWeather() {
        var index = 0
        var citiesList = [CityData]()
        
        for city in rootModel.citiesName {
            
            self.network.gettingWeather(for: city.lat, longitud: city.lon) { [weak self] (data, error) in
                if error != nil {
                    debugPrint(error.debugDescription)
                }
                guard let data = data else { return }
                
                guard let urlIcon = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(data.fact.icon).svg"),
                    let iconData = try? Data(contentsOf: urlIcon)
                    else { return }
                let weatherCIty = CityData(name: data.info.tzinfo.name,
                                           airTemperature: data.fact.temp,
                                           url: data.info.url,
                                           imageWeather: iconData)
                citiesList.append(weatherCIty)
                if index != 9 {
                    index += 1
                } else {
                    self!.loadMain(city: citiesList)
                }
            }
            
            
        }
        
    }
    
    
}


