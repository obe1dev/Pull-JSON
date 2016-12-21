//
//  JsonTableViewController.swift
//  Pull JSON
//
//  Created by Brock Oberhansley on 5/24/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class JsonTableViewController: UITableViewController {
    
    var myData: [Model] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        JsonDataController.searchJson("url") { (jsonData) in
            self.myData = jsonData
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        
        let info = myData[indexPath.row]
        
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.date
        
        return cell
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? DetailViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row {
            
            _ = destinationViewController.view
            
            let message = myData[selectedIndex]
            
            destinationViewController.messageTextView.text = message.message
        }
    }

}
