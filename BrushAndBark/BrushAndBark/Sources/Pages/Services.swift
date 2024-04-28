import Foundation
import Ignite

struct Services: StaticPage {
    var title = "Services"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Text("SERVICES")
                .font(.title1)
                .fontWeight(.black)
                .margin(.top, .large)
            
            Table {
                Row {
                    "Bathing"
                    "$25"
                    "$30"
                    "$35"
                }
                
                Row {
                    "Full Haircut"
                    "$40"
                    "$50"
                    "$60"
                }
                
                Row {
                    "Nail Trimming"
                    "$15"
                    "$15"
                    "$15"
                }
                
                Row {
                    "Ear Cleaning"
                    "$10"
                    "$10"
                    "$10"
                }
                
                Row {
                    "Teeth Brushing"
                    "$10"
                    "$10"
                    "$10"
                }
                
                Row {
                    "De-shedding Treatment"
                    "$10"
                    "$10"
                    "$10"
                }
                
                Row {
                    "Specialty Syling"
                    "$10"
                    "$10"
                    "$10"
                }
                
                Row {
                    "Complete Grooming Package"
                    "$80"
                    "$90"
                    "$100"
                }
            } header: {
                "Service"
                "Small Dogs"
                "Medium Dogs"
                "Large Dogs"
            }
            .tableStyle(.stripedRows)
        }
        .frame(maxWidth: "90%")
    }
}
