//
//  RaceCircuitViewModel.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
class RaceCircuitViewModel {
    var eventList = [RaceCircuitModel]()
    let dataAccess = DataAccess()
    
    
    func parseDataFromFile() -> EventListJSONModel? {
        var eventJSONFormat : EventListJSONModel?
        eventJSONFormat = nil
        if let data = dataAccess.loadData()  {
            let decoder = JSONDecoder()
            do {
                eventJSONFormat = try decoder.decode(EventListJSONModel.self, from: data)
            } catch {
                print(error)
                
            }
        }
         return eventJSONFormat
    }
    func convertEventsDataToModel(){
       let eventJSON = parseDataFromFile()
        if eventJSON != nil {
        eventList = eventJSON!.events
            print(eventList[0].name)
        }
    }
}
struct EventListJSONModel : Codable {
    var events : [RaceCircuitModel]
}
