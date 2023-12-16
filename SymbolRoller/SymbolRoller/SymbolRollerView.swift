//
//  SymbolRollerView.swift
//  SymbolRoller
//
//  Created by 김우섭 on 12/17/23.
//

import SwiftUI

struct SymbolRollerView: View {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @State var imageName: String = "moon"
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            Text(imageName)
                .font(.system(size: 40, weight: .bold))
            
            Button{
                print("button tapped")
                imageName = symbols.randomElement()!
            } label: {
//                좌 - image 우 ( 상 text , 하 text)
                HStack {
                    Image(systemName: "arrow.3.trianglepath")
                        
                    VStack {
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        Text("랜덤으로 누르기")
                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 80)
            .background(.pink)
//            .cornerRadius(40)
            .clipShape(Capsule())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRollerView()
    }
}
