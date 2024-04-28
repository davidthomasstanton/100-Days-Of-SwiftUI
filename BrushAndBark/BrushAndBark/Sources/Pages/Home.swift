import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Carousel {
            Slide(background: "/images/shades.jpg") {
                Text("Welcome to Brush & Bark")
                    .font(.title1)
                
                Text("We are Oxford's #1 dog grooming salong")
                    .font(.lead)
                
                Link("Make a Booking", target: Contact())
                    .linkStyle(.button)
            }
            .backgroundOpacity(0.4)
            Slide(background: "/images/chair.jpg") {
                Text("Fur-tastic Grooming for your Best Friend")
                
                Text("We off er ful grooming and styling")
                
                Link("All Services", target: Services())
                    .linkStyle(.button)
                    .role(.secondary)
                    
                    
            }
            .backgroundOpacity(0.4)
            
            Slide(background: "/images/wind.jpg") {
                Text("You're barking up the right tree")
                    .font(.title1)
                
                Text("We're here to make every pup look pupperific")
                    .font(.lead)
                
                Link("Email Us", target: "mailtO.com")
                    .linkStyle(.button)
                    .role(.info)
            }
            .backgroundOpacity(0.4)
        }
        
        Group {
            Text("ABOUT US")
                .font(.title1)
                .fontWeight(.black)
                .margin(.top, .large)
            
            Text(placeholderLength: 50)
                .font(.lead)
            
            Text("Dave and John")
                .font(.lead)
                .fontWeight(.bold)
        }
        .horizontalAlignment(.center)
        .frame(maxWidth: 500)
        .margin(.bottom, .extraLarge)
        
        Section {
            Card(imageName: "/images/rug.jpg") {
                Text("Luna, Samoyed")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .contentPosition(.overlay)
            .imageOpacity(0.5)
            
            Card(imageName: "/images/wind.jpg") {
                Text("Arya, Samoyed")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .contentPosition(.overlay)
            .imageOpacity(0.5)
            
            Card(imageName: "/images/car.jpg") {
                Text("Luna, Samoyed")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .contentPosition(.overlay)
            .imageOpacity(0.5)
        }
        .columns(3)
    }
}
