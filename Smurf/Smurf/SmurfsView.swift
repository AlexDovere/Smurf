//
//  SmurfView.swift
//  Smurf
//
//  Created by Alex on 22/07/2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SmurfsView: View {
	@State var showSmartInfo = false
	@ObservedObject var store = DataStore()
	
	var body: some View {
		NavigationView {
			List {
				ForEach(store.smurfs){
				smurf in
				ZStack {
					VStack {
						Text(smurf.name)
							.font(.title)
							.bold()
							.foregroundColor(Color(#colorLiteral(red: 0.1887319684, green: 0.7211136222, blue: 0.9641235471, alpha: 1)))
						ZStack {
							
							WebImage(url: URL(string: "https://raw.githubusercontent.com/Bofin/iOSTechTestData/master/"+"\(smurf.path ?? "")"))
								.resizable()
								.scaledToFit()
								.cornerRadius(30)
							RoundedRectangle(cornerRadius: 30, style: .continuous).strokeBorder(lineWidth: 2)
								.foregroundColor(Color(#colorLiteral(red: 0.1887319684, green: 0.7211136222, blue: 0.9641235471, alpha: 1)))
								.shadow(radius: 3)
						}
					}
					NavigationLink(destination: SmurfWiki(smurfWiki: smurf.wikipediaInfo, smurfName: smurf.name)) {
						EmptyView()
					}.buttonStyle(PlainButtonStyle())
				}
			}
			.navigationBarTitle(Text("Smurf Viewer").foregroundColor(Color(#colorLiteral(red: 0.1887319684, green: 0.7211136222, blue: 0.9641235471, alpha: 1))))
			}
	}
}
}

struct SmurfView_Previews: PreviewProvider {
	static var previews: some View {
		SmurfsView()
	}
}
