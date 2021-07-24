//
//  SettingEditImageView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 01/05/2021.
//

import SwiftUI

struct SettingEditImageView: View {
    
    @State var title: String
    @State var description: String
    @State var selectdImage: UIImage //  Image shown on this screen
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    @State var showImagePicker: Bool = false
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            HStack{
                Text( description)
                Spacer(minLength: 0)
            }
            
            Image(uiImage: selectdImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(12)
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                Text("Import".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.purpleColor)
            .sheet(isPresented: $showImagePicker, content: {
                ImagePicker(ImageSelected: $selectdImage, sourceType: $sourceType)
            })
            
            
            
            Button(action: {
                
            }, label: {
                Text(loc("SALV").uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
            })
            .accentColor(Color.MyTheme.yellowColor)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }}

struct SettingEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingEditImageView(title: "Title", description: "Description", selectdImage: UIImage(named: "dog1")!)
        }
        
    }
}
