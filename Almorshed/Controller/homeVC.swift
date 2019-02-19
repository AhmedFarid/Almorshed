//
//  ViewController.swift
//  Almorshed
//
//  Created by farido on 1/22/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import RealmSwift
import NightNight

class homeVC: UIViewController ,UITextFieldDelegate{

    
    
    @IBOutlet weak var totalSearch: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var imagebc: UIImageView!
    
    @IBOutlet weak var searchByGoz2: UITextField!
    @IBOutlet weak var searchBySoura: UITextField!
    
    var parts = [part]()
    
    var elgoz2 = ["","الجزء الاول","الجزء الثاني","الجزء الثالث","الجزء الرابع","الجزء الخامس","الجزء السادس","الجزء السابع","الجزء الثامن","الجزء التاسع","الجزء العاشر","الجزء الحادي عشر","الجزء الثاني عشر","الجزء الثالث عشر","الجزء الرابع عشر","الجزء الخامس عشر",""]
    
    var elsoura = ["","سورة الفاتحة","سورة البقرة","سورة ال عمران","سورة النساء","سورة المائدة","سورة الانعام","سورة الاعراف","سورة الانفال","سورة التوبة","سورة يونس","سورة هود","سورة يوسف","سورة الرعد","سورة ابراهيم","سورة الحجر","سورة النحل","سورة الاسراء",""]
    
    var selectedGoz2 = ""
    var selectedSora = ""
    
    var selectedGoz2String: String?
    var selectedSoraString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.mixedImage = MixedImage(normal: UIImage(named: "logo")!, night: UIImage(named: "Layer 3")!)
        
        label1.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        label2.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        label3.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        label4.mixedTextColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        navigationController?.navigationBar.mixedTitleTextAttributes = [NNForegroundColorAttributeName: MixedColor(normal: 0xfafafa, night: 0xfafafa)]
        
        navigationController?.navigationBar.mixedBarTintColor = MixedColor(normal: 0x6D4738, night: 0x222222)
        //        navigationController?.navigationBar.mixedTintColor = MixedColor(normal: 0x6D4738, night: 0xfafafa)
        
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)
        //button.mixedTintColor = MixedColor(normal: 0x222222, night: 0xfafafa)
        
        self.totalSearch.delegate = self
        
        customBackBtton()
        imageText()
        //loadData()
        createGoz2Piker()
        createSouraPiker()
        //textEnabeld()
        //addNew()
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        totalSearch.resignFirstResponder()  //if desired
        self.searchTotal()
        
        return true
    }
    
    func searchTotal(){
        if searchByGoz2.text?.isEmpty == false {
            let config = Realm.Configuration(
                // Get the URL to the bundled file
                fileURL: Bundle.main.url(forResource: "default", withExtension: "realm"),
                // Open the file in read-only mode as application bundles are not writeable
                readOnly: true)
            
            // Open the Realm with the configuration
            let realm = try! Realm(configuration: config)
            //let realm = try! Realm()
            var tanDogs = realm.objects(part.self)
            let predicate = NSPredicate(format: "text CONTAINS %@ AND elgoz2 CONTAINS %@", "\(totalSearch.text ?? "")",selectedGoz2String ?? "")
            tanDogs = realm.objects(part.self).filter(predicate)
            self.parts = Array(tanDogs)
            print(tanDogs)
            print(tanDogs.count)
            print(parts)
        }else if searchBySoura.text?.isEmpty == false {
            let config = Realm.Configuration(
                // Get the URL to the bundled file
                fileURL: Bundle.main.url(forResource: "default", withExtension: "realm"),
                // Open the file in read-only mode as application bundles are not writeable
                readOnly: true)
            
            // Open the Realm with the configuration
            let realm = try! Realm(configuration: config)
            //let realm = try! Realm()
            var tanDogs = realm.objects(part.self)
            let predicate = NSPredicate(format: "text CONTAINS %@ AND elsoura2 CONTAINS %@", "\(totalSearch.text ?? "")",selectedSoraString ?? "")
            tanDogs = realm.objects(part.self).filter(predicate)
            self.parts = Array(tanDogs)
            print(tanDogs)
            print(tanDogs.count)
            print(parts)
        }else if searchByGoz2.text?.isEmpty == true && searchBySoura.text?.isEmpty == true {
            let config = Realm.Configuration(
                // Get the URL to the bundled file
                fileURL: Bundle.main.url(forResource: "default", withExtension: "realm"),
                // Open the file in read-only mode as application bundles are not writeable
                readOnly: true)
            
            // Open the Realm with the configuration
            let realm = try! Realm(configuration: config)
            //let realm = try! Realm()
            var tanDogs = realm.objects(part.self)
            let predicate = NSPredicate(format: "text CONTAINS %@", "\(totalSearch.text ?? "")")
            tanDogs = realm.objects(part.self).filter(predicate)
            self.parts = Array(tanDogs)
            print(tanDogs)
            print(tanDogs.count)
            print("cccc\(parts)")
        }else {
            let config = Realm.Configuration(
                // Get the URL to the bundled file
                fileURL: Bundle.main.url(forResource: "default", withExtension: "realm"),
                // Open the file in read-only mode as application bundles are not writeable
                readOnly: true)
            
            // Open the Realm with the configuration
            let realm = try! Realm(configuration: config)
            //let realm = try! Realm()
            var tanDogs = realm.objects(part.self)
            let predicate = NSPredicate(format: "text CONTAINS %@ AND elgoz2 CONTAINS ٪@ AND elsoura2 CONTAINS %@", "\(totalSearch.text ?? "")",self.selectedGoz2String ?? "",selectedSoraString ?? "")
            tanDogs = realm.objects(part.self).filter(predicate)
            self.parts = Array(tanDogs)
            print(tanDogs)
            print(tanDogs.count)
            print(parts)
        }
        
        if totalSearch.text?.isEmpty == false {
            self.performSegue(withIdentifier: "suge", sender: parts)
        }
        
    }
    
    
    @IBAction func searchBTN(_ sender: Any) {
        self.searchTotal()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let searchvc = segue.destination as? searchVC else { return }
        searchvc.parts = sender as! [part]
        searchvc.textSerch = totalSearch.text ?? ""
    }
    
    
    func textEnabeld() {
        if parts.isEmpty == true {
            searchByGoz2.isEnabled = false
            searchBySoura.isEnabled = false
            //prandTF.isEnabled = false
        }else {
            searchByGoz2.isEnabled = true
            searchBySoura.isEnabled = true
            //prandTF.isEnabled = true
        }
    }
    
    func createGoz2Piker(){
        let catPiker = UIPickerView()
        catPiker.delegate = self
        catPiker.dataSource = self
        catPiker.tag = 0
        searchByGoz2.inputView = catPiker
        catPiker.reloadAllComponents()
    }
    
    func createSouraPiker(){
        let subPiker = UIPickerView()
        subPiker.delegate = self
        subPiker.dataSource = self
        subPiker.tag = 1
        searchBySoura.inputView = subPiker
        subPiker.reloadAllComponents()
    }
    
    func addNew(){
        let parts = part()
        parts.elgoz2 = "ff"
        parts.elsoura = "ddd"
        parts.elsoura2 = "ddd"
        parts.meaning = "dddd"
        parts.text = "ddd"
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(parts)
        }
        
    }
    
    func loadData(){
        let realm = try! Realm()
        let parts = realm.objects(part.self)
        self.parts = Array(parts)
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "Layer 555"){
            
            totalSearch.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
}


extension homeVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return elgoz2.count
        }else {
            return elsoura.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return elgoz2[row]
        }else{
            return elsoura[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            selectedGoz2String = elgoz2[row]
            searchByGoz2.text = selectedGoz2String
            self.view.endEditing(false)
        }else {
            selectedSoraString = elsoura[row]
            searchBySoura.text = selectedSoraString
            self.view.endEditing(false)
        }
    }
}

