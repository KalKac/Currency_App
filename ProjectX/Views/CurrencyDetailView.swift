//
//  CurrencyDetailView.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import SwiftUI

struct CurrencyDetailView: View {
    @StateObject var viewModel = HistoryData()
    @State var name: String
    @State var value: Double
    @State var showData: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing:  40){
            
            Text(name)
                .fontWeight(.semibold)
            Text(String(format: "Value: %.2f", value))
                .fontWeight(.semibold)
            
            
            if showData{
                
                if viewModel.historyConversionData.isEmpty{
                    ProgressView()
                }else {
                    Text(viewModel.date)
                        .fontWeight(.semibold)
                    
                    List{
                        ForEach(viewModel.historyConversionData){ data in
                            HStack{
                            
                                Text(String(format: "Week Ago value: %.2f", data.currencyValue))
                                    .fontWeight(.semibold)
                                
                            }
                            
                            
                            
                        }
                    }
                }
     
                
                
                
            }else{
                Button {
                    viewModel.symbol = name
                    viewModel.calculateDate()
                    viewModel.HistoryFetch()
                    showData.toggle()

                    
                } label: {
                    Text("Show History")
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 50)
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            
           
            
            
        }
    }
}

struct CurrencyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetailView(name: "PLN", value: 4.20)
    }
}
