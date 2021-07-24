//
//  SettingsLabelView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 30/04/2021.
//

import SwiftUI

struct SettingsLabelView: View {
    var labeltext: String
    var labelImage: String
    
    var body: some View {
        
        VStack {
            HStack{
                
                Text(labeltext)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: labelImage)
                
            }
            Divider()
                . padding(.vertical,4)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labeltext: "Text Label", labelImage: "star")
            .previewLayout(.sizeThatFits)
    }
}
