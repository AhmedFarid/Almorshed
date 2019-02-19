//
//  searchCell.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight


class searchCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var elgoz2: UILabel!
    @IBOutlet weak var mean: UILabel!
    
    override func awakeFromNib() {
        
        
        //layer.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
        
        name.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        elgoz2.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        mean.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
    }
    
    var share: (()->())?
    
    func configuerCell(search: part) {
        name.text = search.elsoura2
        elgoz2.text = search.elgoz2
        mean.text = "\(search.elsoura ?? "" )\n\n\(search.meaning ?? "")"
        
        
        
    }
    @IBAction func share(_ sender: Any) {
        share?()
    }
}
