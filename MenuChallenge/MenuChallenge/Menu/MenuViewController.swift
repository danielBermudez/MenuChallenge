//
//  MenuViewController.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/15/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    var menuItemModelList = [MenuItemModel]()
    let menuViewModel = MenuViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMenuItems()
       
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    private func loadMenuItems(){
        menuViewModel.createMenuItemList()
        menuItemModelList = menuViewModel.menuItemList
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemModelList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.textLabel?.textColor = .white
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.1205186918, green: 0.2491704524, blue: 0.4326423705, alpha: 0.8470588235)
        cell.selectedBackgroundView = bgColorView
        cell.textLabel?.text = menuItemModelList[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("ItemSelected"), object: nil, userInfo:[ "presentationMode": menuItemModelList[indexPath.row].tableID])
        tableView.reloadData()
    }
}
