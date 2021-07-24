//
//  PostImageView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 27/04/2021.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State var captionText: String = ""
    @Binding var imageSeleted : UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                } , label: {
                  Image(systemName: "xmark")
                    .font(.title)
                    .padding()
                        
                })
                .accentColor(.primary)
                
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false, content: {
               Image(uiImage: imageSeleted)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(12)
                .clipped()
                
                TextField(loc("TXTFIELDPHOTO"), text: $captionText)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.beigeColor: Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .font(.headline)
                    .padding(.horizontal)
                    .autocapitalization(.sentences)
                
                Button(action: {
                    postPicture()
                }, label: {
                        Text(loc("POSTIMMAG").uppercased())
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor)
                            .cornerRadius(12)
                            .padding(.horizontal)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor : Color.MyTheme.purpleColor)
            })
        })
    }
    
    // MARK: FUNCTIONS
    func postPicture(){
        print(loc("POSTIMMAGDTBASE"))
    }
}

struct PostImageView_Previews: PreviewProvider {
    @State static var  image = UIImage(named: "developer1")!
    
    static var previews: some View {
        PostImageView(imageSeleted: $image)
            .preferredColorScheme(.light)
            
    }
}
