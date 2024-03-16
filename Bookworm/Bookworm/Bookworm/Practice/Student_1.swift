//
//  Student_1.swift
//  Bookworm
//
//  Created by David Stanton on 3/15/24.
//
import SwiftData
import Foundation

@Model
class Student_1 {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
