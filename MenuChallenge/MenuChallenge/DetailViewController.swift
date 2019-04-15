//
//  ViewController.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/15/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var delegate : menuControDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func onMenuTapped(_ sender: Any) {
      if let delegate = delegate {
            delegate.toggleMenu()
        }
        
    }
    

}
protocol menuControDelegate {
    func toggleMenu()
}

