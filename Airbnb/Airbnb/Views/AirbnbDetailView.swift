//
//  AirbnbDetailView.swift
//  Airbnb
//
//  Created by 김우섭 on 1/7/24.
//

import SwiftUI

struct AirbnbDetailView: View {
    let model: AirbnbListing
    
    var body: some View {
        
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    // Picture
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).width)
                        .clipped()
                    
                    // Info
                    Text(model.name ?? "")
                        .bold()
                        .padding()
                    
                    if let price = model.price {
                        Text("Nightly Rate: \(price.formatted(.currency(code: "USD")))")
                    }
                    
                    Text("Description: \(model.description ?? "")")
                        .padding()
                    Text("summary: \(model.summary ?? "")")
                        .padding()
                    Text("House Rules: \(model.house_rules ?? "")")
                        .padding()
                    Text("Space: \(model.space ?? "")")
                        .padding()
                    
                    
                    // Host Info
                    Text("About Your Host")
                        .font(.title2)
                        .bold()
                    
                    HStack {
                        AsyncImage(url: URL(string: model.host_thumbnail_url ?? ""))
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        Text(model.host_name ?? "")
                            .bold()
                        
                    }
                    .padding()
                    
                    Text("Hosting since: " + (model.host_since ?? ""))
                }
                .frame(maxWidth: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}

//#Preview {
//    AirbnbDetailView()
//}
