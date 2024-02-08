//
//  ContentViewModel.swift
//  GeometryReader
//
//  Created by woosub kim  on 2/8/24.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var selectedTab: Tab = .one
}
