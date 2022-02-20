//
//  StartAppView.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 20/02/2022.
//

import SwiftUI

struct StartAppView: View {
    var body: some View {
            VStack{
                Text("Currencly Online")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(.horizontal)
                ImgView()
                    .padding()
              


            

        
    }
}

struct StartAppView_Previews: PreviewProvider {
    static var previews: some View {
        StartAppView()
    }
}
}
