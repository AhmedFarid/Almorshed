//
//  API.swift
//  Almorshed
//
//  Created by Farido on 1/27/19.
//  Copyright © 2019 Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    
    class func login(contact_name: String, contact_email: String, contact_subject: String,contact_message: String, completion: @escaping (_ error: Error?, _ success: Bool, _ mesage: String?)->Void) {
        
        let url = "http://almorshed.co/api/contact"
        let parameters = [
            "contact_name": contact_name,
            "contact_email": contact_email,
            "contact_subject": contact_subject,
            "contact_message": contact_message
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 100..<400)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                    completion(error,false,nil)
                    print(error)
                    
                case .success(let value):
                    print(value)
                    let json = JSON(value)
                    print(json)
                    if let mesage = json["data"].string{
                        print(mesage)
                        completion(nil,true,mesage)
                    }
                }
        }
    }
}
