//
//  LoadDataFromJson.swift
//  MenuChallenge
//
//  Created by Daniel Bermudez on 4/16/19.
//  Copyright © 2019 Endava. All rights reserved.
//

import Foundation
struct DataAccess {
    func loadData () -> Data? {
        do {
        guard let path = Bundle.main.path(forResource: "ImsaData" , ofType: "json")
            else {
                return nil
        }
        return try Data(contentsOf:URL(fileURLWithPath: path), options: .mappedIfSafe )
        }catch{
           print(error)
            return nil
        }
    }
}
