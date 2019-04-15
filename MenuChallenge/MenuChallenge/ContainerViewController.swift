//
//  ContainerViewController.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/15/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
   
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
}
extension ContainerViewController : menuControDelegate{
    func toggleMenu() {
        if sideMenuOpen{
            sideMenuConstraint.constant = -240
        }else {
            sideMenuConstraint.constant = 0
        }
    
    }
    
}

