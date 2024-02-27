////
////  DetailView.swift
////  Navigation
////
////  Created by David Stanton on 2/24/24.
////
//
//import SwiftUI
//
//struct DetailView: View {
//    
//    var number: Int
//    @Binding var path: [Int]
//    
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//    }
//    
//    init(number: Int, path: [Int]) {
//        self.number = number
//        self.path = path
//        print("Creating detail view \(number)")
//    }
//}
//
//#Preview {
//    DetailView(number: 558)
//}
