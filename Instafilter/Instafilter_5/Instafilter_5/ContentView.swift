//
//  ContentView.swift
//  Instafilter_5
//
//  Created by David Stanton on 4/4/24.
//
// ==== ContentView ====
// import CoreImage / ...CIFilterBuiltins / PhotosUI / StoreKit / SwiftUI
// var for processedImage / filterIntensity / selectedItem / currentFilter (set to Sepia) / showingFilters / filterCount / requestReivew / context
// NavStack with a PhotosPicker showing processedImage or ContentUnavailable
// Intensity Slider
// Change Filter Button
// If we have a processedImage, create a link to show it
// ConfirmationDialog with all options for changing filter: Crystallize, edges, gaussain blur, pixellate, sepia, unsharpen mask, vignette, cancel

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var filterIntensity = 0.5
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    @State private var showingFilter = false
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage.resizable().scaledToFit()
                    } else {
                        ContentUnavailableView("Image Filter", systemImage: "photo.badge.plus", description: Text("Tap to select an image"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter_5", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter_5")
            .confirmationDialog("Set Filter", isPresented: $showingFilter) {
                // Crystallize, edges, gaussain blur, pixellate, sepia, unsharpen mask, vignette, cancel
                Button("Crystallize") { setFilter(CIFilter.crystallize() )}
                Button("Edges") { setFilter(CIFilter.edges() )}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur() )}
                Button("Pixellate") { setFilter(CIFilter.pixellate() )}
                Button("Sepia") { setFilter(CIFilter.sepiaTone() )}
                Button("Unsharpen Mask") { setFilter(CIFilter.unsharpMask() )}
                Button("Vignette") { setFilter(CIFilter.vignette() )}
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    // func changeFilter() toggles showingFilters
    func changeFilter() {
        showingFilter.toggle()
    }
    // func loadImage
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
    // set inputKeys to the currentFilter inputKeys
    // for kCIInputIntensity, Radius, Scale, set the filterItensity to that
    // apply currentFilter or return (outputImage)
    // create a cgImage from context of the output or return (cgImage)
    // create uiImage from the cgImage (uiImage)
    // assign it to the processedImage
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 20, forKey: kCIInputScaleKey) }
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    // func setFilter that accepts a CIFilter
    // sets the currentFilter to that filter, then loadImage()
    // increments filterCount, if filterCount >= 20, requestReview
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        if filterCount == 3 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
