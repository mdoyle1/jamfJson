//
//  jamfStructs.swift
//  jamfJsonParsing
//
//  Created by Doyle, Mark(Information Technology Services) on 12/28/18.
//  Copyright © 2018 Doyle, Mark(Information Technology Services). All rights reserved.
//

import Foundation


//Building Struct
struct BuildingSetup: Decodable {
    let buildings: [Buildings]
}

struct Buildings: Decodable {
    let id: Int
    let name: String
}
