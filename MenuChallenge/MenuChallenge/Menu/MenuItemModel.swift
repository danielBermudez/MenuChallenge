//
//  MenuItemModel.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
struct MenuItemModel {
    let tableID : Int
    let title : String
    
    init(tableID : Int, title : String) {
        self.tableID = tableID
        self.title = title
    }
}
