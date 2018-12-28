//
//  ViewController.swift
//  jamfJsonParsing
//
//  Created by Doyle, Mark(Information Technology Services) on 12/27/18.
//  Copyright © 2018 Doyle, Mark(Information Technology Services). All rights reserved.
//

import Cocoa


class ViewController: NSViewController{
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
    }
    
    private func fetchData(){
        let feedParser = APIrequest()
        feedParser.jamfBuildings(type: "computers")    }
}
