//
//  ViewController.swift
//  jamfJsonParsing
//
//  Created by Doyle, Mark(Information Technology Services) on 12/27/18.
//  Copyright © 2018 Doyle, Mark(Information Technology Services). All rights reserved.
//

import Cocoa


struct BuildingSetup: Decodable {
let buildings: [Buildings]
}

struct Buildings: Decodable {
    let id: Int
    let name: String
}


class ViewController: NSViewController{
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Setup Authenticated Session!
        let username = ""
        let password = ""
        
        let jamfUrl = "/JSSResource/buildings"
        
        // Request options
        var request = URLRequest(url: URL(string:jamfUrl)!)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let config = URLSessionConfiguration.default
        
        //API Authentication
        let userPasswordString = "\(username):\(password)"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString(options: [])
        let authString = "Basic \(base64EncodedCredential)"
        config.httpAdditionalHeaders = ["Authorization" : authString]
        
        
        URLSession(configuration: config).dataTask(with: request) { (data, response, err) in
            
            //DECODE THE JSON!
            guard let data = data else { return }
            guard let building = try? JSONDecoder().decode(BuildingSetup.self, from: data) else {return}
            
            //Print All the Buildings...
            let numberOfBuildings = building.buildings.count-1
            let ecsu = building.buildings[0 ... numberOfBuildings]
            
            //Print Names Of Buildings... The _ escapes printing the index...
            for (_,value) in ecsu.enumerated() {
                print("\(value.name) : \(value.id)")
            }
            
        }.resume()
      
    
    }
    
    
}
