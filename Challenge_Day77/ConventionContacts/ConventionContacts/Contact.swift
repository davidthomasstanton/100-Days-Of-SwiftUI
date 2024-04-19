//
//  Contact.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/18/24.
//

import Foundation
import SwiftData
import PhotosUI
import SwiftUI

@Model
class Contact: Codable {
    let id: UUID
    var name: String
    var company: String

    @Attribute(.externalStorage) var photo: Data
    
    static let examplePhoto = UIImage(imageLiteralResourceName: "SquirtleHeadShot")
    static let photoData = examplePhoto.jpegData(compressionQuality: 1.0)!
    
    init(id: UUID, name: String, company: String, photo: Data) {
        self.id = id
        self.name = name
        self.company = company
        self.photo = photo
        

    }
    
    #if DEBUG
    static let exampleContact = Contact(id: UUID(), name: "Squirtle", company: "Nintendo", photo: photoData)
    #endif
}
