//
//  ContentView.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var start: Bool = false

    var body: some View {
        
        if start{
            CurrenciesListView()
        }else{
            VStack{
                StartAppView()
                    .padding(.horizontal)
                Button {
                    start.toggle()
                } label: {
                    Text("Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.secondary)
                        .cornerRadius(10)
                }

            }
          
        }
          
     
    
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
