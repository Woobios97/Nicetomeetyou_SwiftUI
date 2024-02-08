//
//  IceCream.swift
//  FocusStateExmaple
//
//  Created by woosub kim  on 1/25/24.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry:  return .blueberries
        }
    }
}

struct IceCream: View {
    @State private var seletectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    var body: some View {
        VStack {
            Picker("Flavor", selection: $seletectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                }
            }
            Picker("Topping", selection: $suggestedTopping) {
                ForEach(Topping.allCases) { topping in
                    Text(topping.rawValue.capitalized)
                }
            }
        }
        .pickerStyle(.segmented)
    }
}


#Preview {
    IceCream()
}

//        List {
//            Picker("Flavor", selection: $suggestedTopping) {
//                ForEach(Flavor.allCases) { flavor in
//                    Text(flavor.rawValue.capitalized)
//                        .tag(flavor.suggestedTopping)
//
//                }
//            }
//            HStack {
//                Text("Suggested Topping")
//                Spacer()
//                Text(suggestedTopping.rawValue.capitalized)
//                    .foregroundStyle(.secondary)
//            }
//        }
