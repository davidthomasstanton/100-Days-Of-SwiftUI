//
//  MeView.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//
// MeView
// import CoreImage.CIFilterBuiltins
// set name and emailAddress in AppStorage
// create context and filter for the qrCodeGenerator
// Display name/emailAddress in a form with .textContentType
// display qrCode
// func generateQRCode()
// convert string.utf8 into Data and assign to the filter message
// create outputImage from filter output, create a cgImage from that
// return a UIImage from the cg
// if that fails, return "xmark.circle" nil coallescing for a blank UIImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
            }
            .navigationTitle("Your code")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
