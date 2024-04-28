import Foundation
import Ignite

struct Reviews: StaticPage {
    struct CustomerReview: Decodable {
        var name: String
        var text: String
    }
    
    var title = "Reviews"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Text("REVIEWS")
                .font(.title1)
                .fontWeight(.black)
                .margin(.top, .large)
            
            if let reviews = context.decode(resource: "reviews.json", as: [CustomerReview].self) {
                Section {
                    for review in reviews {
                        Card {
                            review.text
                        } footer: {
                            review.name
                        }
                        .margin(.top, 20)
                    }
                }
                .columns(4)
            }
        }
        .frame(maxWidth: "90%")
    }
}
