//
//  WebViewController.swift
//  weather
//
//  Created by MIkkyMouse on 08.09.2020.
//  Copyright © 2020 Ivan Sosnovich. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    var url = ""
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(webView)
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
    

    

}
