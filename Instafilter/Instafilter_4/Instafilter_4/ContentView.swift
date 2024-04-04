//
//  ContentView.swift
//  Instafilter_4
//
//  Created by David Stanton on 4/3/24.
//
// ==== ContentView ====
// import CoreImage / ...CIFilterBuiltins / PhotosUI / SwiftUI
// var for processedImage / filterIntensity / selectedItem / currentFilter (set to Sepia) / context
// NavStack with a PhotosPicker showing processedImage or ContentUnavailable
// Intensity Slider
// Change Filter Button

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage.resizable().scaledToFit()
                    } else {
                        ContentUnavailableView("Photo Unavailable", systemImage: "photo.badge.plus", description: Text("Tap to add photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                Spacer()
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter_4")
        }
    }
    func changeFilter() {
        
    }
    // func loadImage()
    // asyncronously get raw data from selectedItem or return (imageData)
    // convert the raw image to UIImage or return (inputImage)
    // convert the UIImage to a CIImage (beginImage)
    // apply the currentFilter to the CIImage with a kCIInputImageKey
    // applyProcessing
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    // func applyProcessing()
    // set currentFilter intensity to the filterIntensity
    // apply currentFilter or return (outputImage)
    // create a cgImage from context of the output or return (cgImage)
    // create uiImage from the cgImage (uiImage)
    // assign it to the processedImage
    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
