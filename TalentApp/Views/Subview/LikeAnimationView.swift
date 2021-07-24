//
//  LikeAnimationView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 02/05/2021.
//

import SwiftUI

struct LikeAnimationView: View {
    
    
    @Binding var animate: Bool
    var body: some View {
        ZStack {
            
            
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow.opacity(0.3))
                .font(.system(size: 200))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.3)
            
            Text("TALENT")
                .foregroundColor(.orange)
                .frame(width: 200, height: 200, alignment: .center)
                .scaleEffect(animate ? 1.0 : 0.2)
                
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow.opacity(0.6))
                .font(.system(size: 150))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.4)
            
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow.opacity(0.9))
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)
        }
        .animation(Animation.easeInOut(duration: 0.5))
        
    }
}

struct LikeAnimationView_Previews: PreviewProvider {
    
    @State static var animate: Bool = false
    static var previews: some View {
        LikeAnimationView(animate: $animate)
            .previewLayout(.sizeThatFits)
    }
}
