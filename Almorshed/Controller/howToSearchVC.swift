//
//  howToSearchVC.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight

class howToSearchVC: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
        logo.mixedImage = MixedImage(normal: UIImage(named: "logo")!, night: UIImage(named: "Layer 3")!)
        
        label1.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        label2.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
    }
    
    @IBAction func shareApp(_ sender: Any) {
        
        let activityController = UIActivityViewController(activityItems: ["http://almorshed.co/"], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
}
