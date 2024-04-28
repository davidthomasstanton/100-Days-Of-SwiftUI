import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                let brandImage = Image("/images/logo.svg", description: "Brush & Bark")
                    .frame(width: 200)
                NavigationBar(logo: brandImage) {
                    // links go here
                    Link("Services", target: Services())
                    Link("Reviews", target: Reviews())
                    Link("Blog", target: Blog())
                    Link("Contact Us", target: Contact())
                    Link("Help", target: Help())
                }
                    .backgroundColor("#2c3e50")
                    .navigationBarStyle(.dark)
                    .navigationItemAlignment(.trailing)
                
                page.body

                IgniteFooter()
            }
        }
    }
}
