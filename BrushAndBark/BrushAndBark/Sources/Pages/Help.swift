import Foundation
import Ignite

struct Help: StaticPage {
    var title = "Help"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Text("HELP")
                .font(.title1)
                .fontWeight(.black)
                .margin(.top, .large)
            
            // more to come
            Accordion {
                Item("What services do you offer at Brush & Bark?", startsOpen: true) {
                    Text(placeholderLength: 100)
                }
                
                Item("How do I book an appointment?") {
                    Text(placeholderLength: 100)
                }
                
                Item("What are your grooming prices?") {
                    Text(placeholderLength: 100)
                }
                
                Item("How long does a grooming session take?") {
                    Text(placeholderLength: 100)
                }
                
                Item("What do I need for my dog's grooming appointment?") {
                    Text(placeholderLength: 100)
                }
            }
            .openMode(.all)
        }
        .frame(width: "90%")
    }
}
