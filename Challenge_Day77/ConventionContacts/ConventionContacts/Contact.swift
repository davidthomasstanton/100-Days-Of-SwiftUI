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
    enum CodingKeys: CodingKey {
        case id, name, company, photo
    }
    
    let id: UUID
    var name: String
    var company: String
    @Attribute(.externalStorage) var photo: Data
    
    static let examplePhoto = UIImage(imageLiteralResourceName: "SquirtleHeadShot")
    static let examplePhotoData = examplePhoto.jpegData(compressionQuality: 1.0)!
    
    init(id: UUID, name: String, company: String, photo: Data) {
        self.id = id
        self.name = name
        self.company = company
        self.photo = photo
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        company = try container.decode(String.self, forKey: .company)
        photo = try container.decode(Data.self, forKey: .photo)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(company, forKey: .company)
        try container.encode(photo, forKey: .photo)
    }
    
    #if DEBUG
    static let exampleContact = Contact(id: UUID(), name: "Squirtle", company: "Nintendo", photo: examplePhotoData)
    #endif
}
