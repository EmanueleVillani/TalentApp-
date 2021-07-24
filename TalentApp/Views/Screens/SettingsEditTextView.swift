//
//  SettingsEditTextView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 30/04/2021.
//

import SwiftUI

struct SettingsEditTextView: View {
    @Environment(\.presentationMode) var  presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            
            HStack{
                Text(description)
                Spacer(minLength: 0)
            }
           
            
           TextField(placeholder, text: $submissionText)
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(colorScheme == .light ? Color.MyTheme.beigeColor: Color.MyTheme.purpleColor)
            .cornerRadius(12)
            .font(.headline)
            .autocapitalization(.sentences)
            
            Button(action: {
                
            }, label: {
                Text(loc("SALV").uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor: Color.MyTheme.purpleColor)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Test Title", description: loc("DESCR"), placeholder: loc("SEGN_POST_PROV"))
                .preferredColorScheme(.light)
        }
       
    }
}
