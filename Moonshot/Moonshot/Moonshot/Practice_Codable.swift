//
//  Practice_Codable.swift
//  Moonshot
//
//  Created by David Stanton on 2/19/24.
//

import SwiftUI
// struct for User that contains name and address
// struct for Address that contains street and city
// body: button that when clicked converts the JSON string
// and prints the user's street address

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct Practice_Codable: View {

    
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swfit Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
                print(user.address.city)
            }
        }
        
        
    }
}

#Preview {
    Practice_Codable()
}
