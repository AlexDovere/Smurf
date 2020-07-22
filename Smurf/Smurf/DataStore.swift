//
//  DataStore.swift
//  Smurf
//
//  Created by Alex on 21/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import Combine

class DataStore: ObservableObject {
    @Published var smurfs: [Smurfy] = []
    
    init() {
        getSmurfs()
    }
    
    func getSmurfs() {
        Api().getSmurfs { (smurfs) in
            self.smurfs = smurfs
        }
    }
}
