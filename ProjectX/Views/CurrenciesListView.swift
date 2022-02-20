//
//  CurrenciesListView.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 20/02/2022.
//

import SwiftUI

struct CurrenciesListView: View {
    
    @StateObject var ViewModel = ModelData()

    
    var body: some View {
        
        NavigationView{
            
            VStack{
                if ViewModel.conversionData.isEmpty{
                    ProgressView()
                }else{
                    Spacer()
                    
                    
                    ScrollView {
                        LazyVStack(alignment: .center, spacing: 15) {
                            ForEach(ViewModel.conversionData, id: \.id){ rate in
                                
                                HStack() {
                                    NavigationLink {
                                        CurrencyDetailView(name: rate.currencyName, value: rate.currencyValue)
                                        
                                    } label: {
                                        Text(rate.currencyName)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .padding(.horizontal)
                                      Spacer()
                                        Text(String(format: "Value: %.2f ", rate.currencyValue))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .padding(.horizontal)

                                    }
                                    

                                    
                                }.frame(width: 300, height: 50)
                                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.621))
                                    .cornerRadius(10)

                                                                
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarItems(trailing:Text("Base: \(ViewModel.baseSTR)")
                                        .fontWeight(.semibold))
            
            .navigationTitle("Currencies:")
            
            
            
        }
        
        
    }
    
}

struct CurrenciesListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesListView()
    }
}
