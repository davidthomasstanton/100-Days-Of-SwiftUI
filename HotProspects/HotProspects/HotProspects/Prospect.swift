//
//  Prospect.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//
// Prospect data observed class
// name, emailAddress, isContacted

import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
    
    
}
