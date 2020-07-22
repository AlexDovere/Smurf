//
//  Api.swift
//  Smurf
//
//  Created by Alex on 21/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import SwiftUI


struct Smurfy: Codable, Identifiable {
    let id = UUID()
    var name: String
    var wikipediaInfo: String
	var path: String?
	var image: URL?
}

class Api {
	
	
	
    func getSmurfs(completion: @escaping ([Smurfy]) -> ()) {
	
		
        guard let url = URL(string: "https://raw.githubusercontent.com/Bofin/iOSTechTestData/master/SmurfPayload.json") else { return }
	
        URLSession.shared.dataTask(with: url) { (data, _, _) in
			guard let data = data else { return }
            let smurfs = try! JSONDecoder().decode([Smurfy].self, from: data)
			
            DispatchQueue.main.async {
                completion(smurfs)
				
            }
        }
        .resume()
    }
}
