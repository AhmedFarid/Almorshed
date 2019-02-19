//
//  searchVC.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import NightNight

class searchVC: UIViewController {

    var textSerch = ""
    var mean = ""
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var count: UILabel!
    
    var parts = [part]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
        self.navigationItem.title = textSerch
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.001))
        
        self.count.text = "عدد المرات التي ذكرت فيها الكلمة: \(parts.count) مرة\nتطبيق المرشد لمعاني القران"
        
    }

}


extension searchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? searchCell {
            let serch = parts[indexPath.row]
            cell.configuerCell(search: serch)
            cell.share = {
                let activityController = UIActivityViewController(activityItems: ["\(serch.elsoura2 ?? "")\n\(serch.elgoz2 ?? "")\n\(serch.meaning ?? "")"], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
            return cell
        }else {
            return searchCell()
        }
    }
}
