//
//  ImgView.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 20/02/2022.
//

import SwiftUI

struct ImgView: View {
    var body: some View {
        
        VStack{
            Image("Img")
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 5)
                }
                .shadow(radius: 7)
            
            
        }
       
        
        
    }
}

struct ImgView_Previews: PreviewProvider {
    static var previews: some View {
        ImgView()
    }
}
