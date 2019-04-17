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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailControllerSegue" {
            let navigationController = segue.destination as? UINavigationController
            if let detailController = navigationController?.viewControllers.first as? RaceCircuitViewController {
            detailController.menuControldelegate = self
                        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleMenu), name:NSNotification.Name("ItemSelected") , object: nil)

        // Do any additional setup after loading the view.
    }
}
extension ContainerViewController : menuControDelegate{
    func toggleMenu() {
       
        
        if sideMenuOpen{
            sideMenuOpen = false
            self.sideMenuConstraint.constant = -240
        }else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }

        let animator = UIViewPropertyAnimator.init(duration: 0.3, dampingRatio: 0.5, animations: { [unowned self] in
            self.view.layoutIfNeeded()
        })
    animator.startAnimation()
    
    }
    
    
}

