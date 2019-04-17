//
//  MenuViewModel.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
class MenuViewModel {
    var menuItemList = [MenuItemModel]()
    func createMenuItemList(){
      
        let imageMode = MenuItemModel(tableID: 0, title: "Image Mode")
        let textMode = MenuItemModel(tableID: 1, title: "Text Mode")
        let randomMode = MenuItemModel(tableID: 2, title: "Random Mode")
        menuItemList = [imageMode,textMode,randomMode]
    }
}
