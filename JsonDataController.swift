//
//  JsonDataController.swift
//  Pull JSON
//
//  Created by Brock Oberhansley on 5/24/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation

class JsonDataController{
    
    static func searchJson(_ jsonURL: String, completion: @escaping ( _ jsonData: [Model]) -> Void) {
        
//        AppVersion=BSG&userID=2&output=json"
        
        let url = URL(string: "http://bsg.redmatmediabizapp.com/admin/push/getPushNotifications.php?")!
        
        NetworkController.performRequestForURL(url) { (data) in
            
            guard let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let representativeDictionaries = json["results"] as? [[String: AnyObject]] else {
                    
                    print("unable to serialize json")
                    completion([])
                    return
            }
            
            let myData = representativeDictionaries.flatMap({Model(json:$0)})
            
            completion(myData)
        }
    }
    
}
