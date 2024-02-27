////
////  NavigationPath.swift
////  Navigation
////
////  Created by David Stanton on 2/26/24.
////
//
//import SwiftUI
//
//struct NavigationPath: View {
//    @State private var path = NavigationPath()
//
//    var body: some View {
//        NavigationStack(path: $path) {
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: ", value: i)
//                }
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: ", value: String(i))
//                }
//            }
//            .toolbar {
//                Button("Push 556") {
//                    path.append(556)
//                }
//                
//                Button("Push Hello") {
//                    path.append("Hello")
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//            Text("You have selected the number \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//            Text("You have selected the string: \(selection)")
//            }
//        }
//    }
//}
//
//#Preview {
//    NavigationPath()
//}
