//
//  sendMassageVC.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight

class sendMassageVC: UIViewController {

    
    
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var massage: UITextView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        logo.mixedImage = MixedImage(normal: UIImage(named: "logo")!, night: UIImage(named: "Layer 3")!)
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
    }
    
    
    @IBAction func send(_ sender: Any) {
        
        API.login(contact_name: name.text ?? "", contact_email: email.text ?? "", contact_subject: subject.text ?? "", contact_message: massage.text ?? "") { (error: Error?, Success: Bool, data) in
            if Success {
               self.showAlert(title: "ارسال رسالة", message: "\(data ?? "")")
            }
        }
    }
    
}


extension UIViewController {
    func showAlert(title: String, message: String, okTitle: String = "Ok", okHandler: ((UIAlertAction)->Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
