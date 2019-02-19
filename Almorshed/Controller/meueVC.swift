//
//  meueVC.swift
//  Almorshed
//
//  Created by farid on 2/19/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight

class meueVC: UIViewController {

    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackBtton()
        view.mixedBackgroundColor = MixedColor(normal: 0x6D4738, night: 0x222222)
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func switchaction(_ sender: Any) {
        
        if(`switch`.isOn) {
            changeTheme()
        } else {
            changeTheme()
            
        }
    }
    
    @objc func changeTheme() {
        if NightNight.theme == .night {
            NightNight.theme = .normal
        } else {
            NightNight.theme = .night
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return MixedStatusBarStyle(normal: .default, night: .lightContent).unfold()
    }

}
