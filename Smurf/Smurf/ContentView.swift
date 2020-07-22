//
//  ContentView.swift
//  Smurf
//
//  Created by Alex on 21/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
	@State var animate = false
	@State var papaCloud = false
	@State var showSmurfsView = false
	@State var tapped = false
	@State var randomFloat1 : CGFloat = 0.0
	@State var randomFloat2 : CGFloat = 0.0
	@State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@State var run = false
	
	var body: some View {
		ZStack{
			VStack {
				Spacer()
				OriginalBackground(animate: self.$animate)
				if animate{
					VStack {
						PapaSmurf(papaCloud: self.$papaCloud)
							.offset(x: self.randomFloat1, y: self.randomFloat2/0.5)
							.animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
							.onTapGesture {
								self.showSmurfsView = true
								self.tapped = true
						}
						.onAppear{
							DispatchQueue.main.asyncAfter(deadline: .now()+5){
								self.run = true
							}
						}
						if !self.run{
							Text("Don't wait too long, Papa Smurf could run away!")
								.font(.subheadline)
								.foregroundColor(.secondary)
								.animation(Animation.spring())
						}
					}
				}
				Spacer()
			}
			if showSmurfsView{
				SmurfsView()
			}
			
			
		}
		.onReceive(timer){ time in
			if !self.tapped && self.run{
				self.randomFloat1 = .random(in: -50...50)
				self.randomFloat2 = .random(in: -100...200)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
let screen = UIScreen.main.bounds




struct OriginalBackground: View {
	@Binding var animate : Bool
	var body: some View {
		VStack {
			Image(uiImage: #imageLiteral(resourceName: "HomeBackground"))
				.resizable()
				.frame(width: screen.width, height: screen.height*0.3)
				.aspectRatio(contentMode: .fit)
				.scaleEffect(self.animate ? 0 : 1)
				.animation(Animation.spring(response: 0.9, dampingFraction: 1, blendDuration: 0.5))
				.onAppear{
					DispatchQueue.main.asyncAfter(deadline: .now()+2){
						self.animate = true
						
					}
			}
		}
	}
}
