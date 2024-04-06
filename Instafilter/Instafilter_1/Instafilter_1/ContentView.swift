//
//  ContentView.swift
//  Instafilter_1
//
//  Created by David Stanton on 4/3/24.
//
// ==== ContentView ====
// import CoreImage / ...CIFilterBuiltins / PhotosUI / SwiftUI
// var for processedImage / filterIntensity / selectedItem / currentFilter (set to Sepia) / showingFilters / context
// NavStack with a PhotosPicker showing processedImage or ContentUnavailable
// Intensity Slider
// Change Filter Button
// ConfirmationDialog with all options for changing filter: Crystallize, edges, gaussain blur, pixellate, sepia, unsharpen mask, vignette, cancel
//
// func changeFilter() toggles showingFilters
//
// func loadImage
// asyncronously get raw data from selectedItem or return (imageData)
// convert the raw image to UIImage or return (inputImage)
// convert the UIImage to a CIImage (beginImage)
// apply the currentFilter to the CIImage with a kCIInputImageKey
// applyProcessing
//
// func applyProcessing()
// set inputKeys to the currentFilter inputKeys
// for kCIInputIntensity, Radius, Scale, set the filterItensity to that
// apply currentFilter or return (outputImage)
// create a cgImage from context of the output or return (cgImage)
// create uiImage from the cgImage (uiImage)
// assign it to the processedImage
//
// func setFilter that takes in a CIFilter and sets the currentFilter to that, then loads Image()
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var radius = 0.5
    @State private var scale = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilter = false
    let context = CIContext()
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("Photo Unavailable", systemImage: "photo.badge.plus", description: Text("Tap to add image"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Intensity")
                            .foregroundStyle((processedImage == nil) ? .gray : .black)
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity, applyProcessing)
                    }
                    HStack {
                        Text("Radius   ")
                            .foregroundStyle((processedImage == nil) ? .gray : .black)
                        Slider(value: $radius)
                            .onChange(of: radius, applyProcessing)
                    }
                    HStack {
                        Text("Scale     ")
                            .foregroundStyle((processedImage == nil) ? .gray : .black)
                        Slider(value: $scale)
                            .onChange(of: scale, applyProcessing)
                    }
                }
                .disabled(processedImage == nil)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter Image", image: processedImage))
                    }
                }
                .padding(.horizontal, 1)
                .disabled(processedImage == nil)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter_1")
            //Crystallize, edges, gaussain blur, pixellate, sepia, unsharpen mask, vignette, cancel
            .confirmationDialog("Set Filter", isPresented: $showingFilter) {
                Button("Crystallize") { setFilter(CIFilter.crystallize() )}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur() )}
                Button("Pixellate") { setFilter(CIFilter.pixellate() )}
                Button("Sepia") { setFilter(CIFilter.sepiaTone() )}
                Button("Unsharpen Mask") { setFilter(CIFilter.unsharpMask() )}
                Button("Vignette") { setFilter(CIFilter.vignette() )}
                Button("Gloom") { setFilter(CIFilter.gloom() )}
                Button("Bloom") { setFilter(CIFilter.bloom() )}
                Button("Pointillize") { setFilter(CIFilter.pointillize() )}
                Button("Cancel", role: .cancel) { }
                
            }
        }
    }
    func changeFilter() {
        showingFilter.toggle()
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
    // set inputKeys to the currentFilter inputKeys
    // for kCIInputIntensity, Radius, Scale, set the filterItensity to that
    // apply currentFilter or return (outputImage)
    // create a cgImage from context of the output or return (cgImage)
    // create uiImage from the cgImage (uiImage)
    // assign it to the processedImage
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(radius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(scale * 10, forKey: kCIInputScaleKey)
        }
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    // func setFilter that takes in a CIFilter
    // sets the currentFilter to that, then loads Image()
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        if filterCount >= 20 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
