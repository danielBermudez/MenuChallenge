//
//  RaceCircuitViewController.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit
class RaceCircuitViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func onMenuTapped(_ sender: Any) {
        menuControldelegate.toggleMenu()
    }
    
    @IBOutlet weak var raceCircuitTableView: UITableView!
    let raceCircuitViewmodel = RaceCircuitViewModel()
    var menuControldelegate : menuControDelegate!
    var eventList = [RaceCircuitModel] ()
    var presentationMode = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
        NotificationCenter.default.addObserver(self, selector: #selector(changePresentationMode), name: NSNotification.Name("ItemSelected"), object: nil)
    }
    
    @objc private func changePresentationMode(notification : NSNotification) {
        presentationMode = notification.userInfo!["presentationMode"] as! Int
        raceCircuitTableView.reloadData()
    }
    
    private func loadEvents() {
        raceCircuitViewmodel.convertEventsDataToModel()
        eventList = raceCircuitViewmodel.eventList
    }
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = raceCircuitTableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventTableViewCell
      eventCell.configureCell(raceCircuit: eventList[indexPath.row], presentationMode: presentationMode)
        return eventCell
    }
}

@objc protocol menuControDelegate: class {
    func toggleMenu()
}
