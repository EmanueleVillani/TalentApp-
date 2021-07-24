//
//  ImagePicker.swift
//  TalentApp
//
//  Created by Emanuele Villani on 26/04/2021.
//

import Foundation
import SwiftUI


// stiamo creando una struttura immagine immagine che sia conforme
struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var ImageSelected: UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    
    
    //il controller di visualizzazione dell'interfaccia utente
    //E il selettore di immagini ci restituirà un controller di immagine dell'interfaccia utente e lo convertirà fondamentalmente in un'interfaccia utente rapida e il controller dell'immagine dell'interfaccia utente.
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
        
    // il delegato al nostro coordinatore del contesto e il nostro coordinatore è questo coordinatore personalizzato in fondo qui.
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
       
        return picker
    }
    
    //il controller di visualizzazione dell'interfaccia utente.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
    
    }
    
    func makeCoordinator() -> ImagePickerCordinator  {
        return ImagePickerCordinator(parent: self)
    }
    class ImagePickerCordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        init (parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if  let image = info [.editedImage] as? UIImage ?? info[.originalImage] as? UIImage{
                // select the Image for our app
                parent.ImageSelected = image
                
                // dismiss the screen
                parent.presentationMode.wrappedValue.dismiss()
                
                
            }
        }
    }
}
