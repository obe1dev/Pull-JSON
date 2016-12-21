//
//  Model.swift
//  Pull JSON
//
//  Created by Brock Oberhansley on 5/24/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import Foundation

class Model{
    
    let title: String
    let date: String
    let message: String
    
    fileprivate let titleKey = "Title"
    fileprivate let dateKey = "Date"
    fileprivate let messageKey = "Message"
    
    init?(json: [String: AnyObject]){
        
        guard let
        title = json[titleKey] as? String,
        let date = json[dateKey] as? String,
        let message = json[messageKey] as? String
        else {return nil}
        
        self.title = title
        self.date = date
        self.message = message
        
        
    }
}
