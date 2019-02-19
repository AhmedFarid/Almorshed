//
//  electrincVC.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight

class electrincVC: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
        logo.mixedImage = MixedImage(normal: UIImage(named: "logo")!, night: UIImage(named: "Layer 3")!)
        
        label.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
    }
    
    @IBAction func dowload(_ sender: Any) {
        openUrl(urlStr: "https://drive.google.com/uc?id=150A5FmChTs-NNtqWnFhYw153jGfFOfJO&export=download")
        
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
}
