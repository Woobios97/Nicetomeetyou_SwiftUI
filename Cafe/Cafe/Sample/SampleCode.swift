//
//  ContentView.swift
//  Cafe
//
//  Created by 김우섭 on 1/8/24.
//

import SwiftUI

struct SampleHStack: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Text("HStack 알아보기")
                Text("HStack 알아보기")
                Text("HStack 알아보기")
                Text("HStack 알아보기")
                Text("HStack 알아보기")
                Text("HStack 알아보기")
                Text("HStack 알아보기")
            }
        }
        
    }
}


struct SampleLazyHStack: View {
    
    struct Number: Identifiable {
        let value: Int
        var id: Int { value }
    }
    
    let numbers: [Number] = (0...100).map { Number(value: $0) }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(numbers) { number in
                    Text("\(number.value)")
                }
            }
        }
    }
}

struct SampleLazyHGrid: View {
    
    struct Number: Identifiable {
        let value: Int
        var id: Int { value }
    }
    
    // LazyHGird
    //    [], [], [], [], []
    //    [], [], [], [], []
    
    let numbers: [Number] = (0...100).map { Number(value: $0) }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [
                GridItem(.fixed(50)),
                GridItem(.fixed(50)),
                GridItem(.fixed(50)),
                GridItem(.fixed(50))
            ]) {
                ForEach(numbers) { number in
                    Text("\(number.value)")
                }
            }
        }
    }
}

struct SampleList: View {
    
    struct Number: Identifiable {
        let value: Int
        var id: Int { value }
    }
    
    let numbers: [Number] = (0...100).map { Number(value: $0) }
    
    var body: some View {
        List {
            Section(header: Text("Header")) {
                ForEach(numbers) { number in
                    Text("\(number.value)")
                }
            }
            
            Section(header: Text("SecondHeader"), footer: Text("Secondfooter")) {
                ForEach(numbers) { number in
                    Text("\(number.value)")
                }
            }
            
        }
    }
}


#Preview {
    SampleList()
}

