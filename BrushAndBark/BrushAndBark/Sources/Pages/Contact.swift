import Foundation
import Ignite

struct Contact: StaticPage {
    var title = "Contact"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Text("CONTACT US")
                .font(.title1)
                .fontWeight(.black)
                .margin(.top, .large)
            
            Text("We're open six days a week, from 8am to 4pm, and although reseverations are recommended you're always welcome to come on in with your pup!")
            
            List {
                "Address: New College Lane, Oxford, OX1 3BL"
                "Phone: 01865 555-5555"
                "Email: paul@hackingwithswift.com"
            }
            .listStyle(.custom("🐶"))
            
            Text("Find us")
                .font(.title2)
            
            Include("map.html")
        }
        .frame(maxWidth: "90%")
    }
}
