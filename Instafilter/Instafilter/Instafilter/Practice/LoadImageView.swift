//
//  LoadImageView.swift
//  Instafilter
//
//  Created by David Stanton on 4/1/24.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct LoadImageView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    // function to loadImage()
    // create inputImage that is a UIImage out of loaded picture
    // create beginImage that is a CIImage
    // create context that is a CIContext
    // create currentFilter, make it's inputImage the beginImage
    // create variable for amount and inputKeys
    // if the inputKeys contains the IntensityKey, RadiusKey, ScaleKey, set the currentFilter value
    func loadImage() {
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount, forKey: kCIInputScaleKey) }
        
        // get a CIImage from our filter (outputImage) or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from our CIImage (cgImage)
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert that to a UIImage (uiImage)
        let uiImage = UIImage(cgImage: cgImage)
        
        // convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    LoadImageView()
}
