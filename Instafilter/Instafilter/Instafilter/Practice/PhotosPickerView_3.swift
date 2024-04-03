//
//  PhotosPickerView_3.swift
//  Instafilter
//
//  Created by David Stanton on 4/2/24.
//
// ==== PhotosPicker ====
// import PhotosUI, var for pickerItems, and selectedImages
// VStack with a PhotosPicker that loades max 5 images but not screenshots
// ScrollView that goes through the images and shows them
// when the pickerItems is changed, empty out selectedImages, then load the images into selectedImages
import PhotosUI
import SwiftUI

struct PhotosPickerView_3: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            Spacer()
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 5, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Pick a photo", systemImage: "photo")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for image in pickerItems {
                    if let loadedImage = try await image.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView_3()
}
