//
//  ImageTableViewCell.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/17/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var eventCellDescription: UILabel!
    @IBOutlet weak var eventCellImageView: UIImageView!
    @IBOutlet weak var eventCellTitle: UILabel!
    @IBOutlet weak var textLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super .prepareForReuse()
        imageWidth.constant = 82
        textLeadingConstraint.constant = 40
        eventCellTitle.text = nil
        eventCellDescription.text = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eventCellDescription.numberOfLines = 0
        eventCellTitle.numberOfLines = 0
        selectionStyle = .none
    }
    func configureCell(raceCircuit : RaceCircuitModel,presentationMode :Int){
        establishCellContent(raceCircuit: raceCircuit)
        establishCellConstraints(presentationMode: presentationMode)
    }
    
    func establishCellContent(raceCircuit : RaceCircuitModel) {
        eventCellTitle.text = raceCircuit.name
        eventCellDescription.text = raceCircuit.description
        eventCellImageView.image = UIImage(named: raceCircuit.image)
    }
    
    func establishCellConstraints(presentationMode :Int){
        
        if presentationMode == 0 {
            imagePresentationMode()
        } else if presentationMode == 1 {
            textPresentationMode()
            
        } else {
            let randomNumber = Int.random(in: 0...1)
            if randomNumber == 0 {
                imagePresentationMode()
            } else if randomNumber == 1 {
                textPresentationMode()
            }
        }
    }
    
    func imagePresentationMode() {
        imageWidth.constant = 82
        textLeadingConstraint.constant = 40
    }
    
    func textPresentationMode() {
        imageWidth.constant = 0
        textLeadingConstraint.constant = 0
    }
    
}
