//
//  CityCell.swift
//  weather
//
//  Created by MIkkyMouse on 07.09.2020.
//  Copyright © 2020 Ivan Sosnovich. All rights reserved.
//

import UIKit
import SwiftSVG

class CityCell: UITableViewCell {
    
    
    
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityTemperature: UILabel!
    @IBOutlet var icon: UIView!
    
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    let network = NetworkManager.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settings()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if icon.subviews.count > 0 {
            icon.subviews[0].removeFromSuperview()
        }
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(for city: CityData) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.cityName.isHidden = false
        self.cityName.text = city.name
        self.cityTemperature.isHidden = false
        self.cityTemperature.text = "air temperature \(city.airTemperature) С°"
        if icon.subviews.count == 0 {
            let iconData = UIView(SVGData: city.imageWeather)
            iconData.frame = CGRect(x: 0, y: 0 , width: icon.bounds.width, height: icon.bounds.height)
            icon.addSubview(iconData)
        }
            
        
        
        
    }
    
    private func settings() {
        cityName.isHidden = true
        cityTemperature.isHidden = true
        activityIndicator.startAnimating()
    }
    
}
