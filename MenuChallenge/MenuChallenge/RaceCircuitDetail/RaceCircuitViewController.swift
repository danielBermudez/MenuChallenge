//
//  RaceCircuitViewController.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit
class RaceCircuitViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
   

    @objc private func changePresentationMode(notification : NSNotification){
        presentationMode = notification.userInfo!["presentationMode"] as! Int
        raceCircuitTableView.reloadData()
       
        
        
    }
    private func loadEvents(){
        raceCircuitViewmodel.convertEventsDataToModel()
        eventList = raceCircuitViewmodel.eventList
    }
    @IBAction func onMenuTapped(_ sender: Any) {
        menuControldelegate.toggleMenu()
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
        let imageCell = raceCircuitTableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageTableViewCell
        imageCell.imageCellDescription.numberOfLines = 0
        imageCell.imageCellTitle.numberOfLines = 0
        imageCell.imageCellTitle.text = eventList[indexPath.row].name
        imageCell.imageCellDescription.text = eventList[indexPath.row].description
        imageCell.selectionStyle = .none
       imageCell.imageCellImageView.image = UIImage(named: eventList[indexPath.row].image)
        
        if presentationMode == 0 {
            imageCell.imageCellImageView.isHidden = false
            imageCell.textStackView.leadingAnchor.constraint(equalTo: imageCell.textStackView.trailingAnchor, constant: 48).isActive = true
    
        } else if presentationMode == 1 {
            imageCell.imageCellImageView.isHidden = true
            imageCell.textStackView.leadingAnchor.constraint(equalTo: imageCell.contentView.leadingAnchor, constant: 15).isActive = true
            
          
            
        } else {
           let randomNumber = Int.random(in: 0...1)
            if randomNumber == 0 {
                imageCell.setNeedsLayout()
                imageCell.imageCellImageView.isHidden = true
                
            }else {
                imageCell.setNeedsLayout()
                imageCell.imageCellImageView.isHidden = false
                
            }
        }
        return imageCell
    }
    
}




@objc protocol menuControDelegate: class {
    func toggleMenu()
}
