//
//  ImagePicker.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 20/07/2568.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        ImagePickerCoordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePicker
        
        init(_ picker: ImagePicker) {
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.picker.image = uiImage
            }
            
            self.picker.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.picker.dismiss()
        }
    }
}


