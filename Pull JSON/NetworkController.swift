//
//  NetworkController.swift
//  Pull JSON
//
//  Created by Brock Oberhansley on 5/24/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation

class NetworkController{
    
    static func performRequestForURL(_ url: URL, completion:@escaping (_ data: Data?) -> Void){
        
        var request = URLRequest(url: url)
        
        let bodyData = "AppVersion=BSG&userID=2"
        
        request.httpMethod = "POST"
        
        request.httpBody = bodyData.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            completion(data)
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                NSLog("statusCode should be 200, but is \(httpStatus.statusCode)")
                NSLog("response = \(response)")
            }
            
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("responseString = \(responseString)")

        }) 
        
        dataTask.resume()
    }
}
