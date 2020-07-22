//
//  PapaSmurf.swift
//  Smurf
//
//  Created by Alex on 22/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import SwiftUI

struct PapaSmurf: View {
	@State var followPapa = false
	@Binding var papaCloud : Bool
	var body: some View {
		ZStack {
			// Papa
			Image(uiImage: #imageLiteral(resourceName: "papa_Smurf"))
				.resizable()
				.aspectRatio(contentMode: .fit)
				.scaleEffect(self.papaCloud ? 0.8 : 1)
				.offset(x:self.papaCloud ? -screen.width*0.2 : 0 )
				.animation(Animation.spring(response: 0.9, dampingFraction: 1, blendDuration: 0.5))
				.onAppear{
					DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
						self.papaCloud = true
					}
					
			}
			//Papa's cloud
			
			ZStack {
				
				if followPapa{
					Text("Tap me to see everyone")
						.font(.headline)
						.bold()
						.offset(y: -screen.height*0.03)
					.frame(width: screen.width*0.5, height: screen.height*0.15)
				}else{
					Text("Welcome!")
						.font(.title)
						.bold()
						.offset(y: -screen.height*0.03)
					.frame(width: screen.width*0.5, height: screen.height*0.15)
				}
				
				Image(uiImage: #imageLiteral(resourceName: "pngegg"))
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: screen.width*0.5, height: screen.height*0.15)
				
			}
			.offset(x: screen.width*0.25, y: -screen.height*0.25)
			.scaleEffect(self.papaCloud ? 1 : 0)
			.animation(Animation.spring(response: 0.9, dampingFraction: 1, blendDuration: 0.5))
			.onAppear{
				DispatchQueue.main.asyncAfter(deadline: .now()+2){
					self.followPapa = true
				}
			}
		}
	}
}

struct PapaSmurf_Previews: PreviewProvider {
	static var previews: some View {
		PapaSmurf(papaCloud: .constant(true))
	}
}
