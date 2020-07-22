//
//  SmurfWiki.swift
//  Smurf
//
//  Created by Alex on 22/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import SwiftUI

struct SmurfWiki: View {
	@State var smurfWiki : String
	@State var smurfName : String
	var body: some View {
		
		VStack {
			Text(smurfName)
				.font(.title)
				.bold()
				.shadow(radius: 20)
			Spacer()
			Text(smurfWiki)
				.font(.headline)
				.lineSpacing(screen.width*0.02)
				.padding()
			Spacer()
		}
	}
}

struct SmurfWiki_Previews: PreviewProvider {
    static var previews: some View {
		SmurfWiki(smurfWiki: "Papa Smurf is the leader and elder of the Smurfs and can be easily distinguished by his red clothes, bushy white moustache and beard. The Smurfs turn to Papa Smurf when things go wrong. Papa Smurf is skilled in making magical spells and potions. He is much older than the other Smurfs (except for Grandpa and Nanny, who are older than Papa). Papa Smurf often serves the other Smurfs with his knowledge and wisdom and usually devises a plan for how to get out of trouble or to save the Smurf village from attacks by Gargamel. Unlike the other male Smurfs, Papa Smurf's trousers and hat are red instead of white.", smurfName: "Papa Smurf")
    }
}
