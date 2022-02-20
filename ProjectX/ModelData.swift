//
//  ModelData.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import Foundation


class ModelData: ObservableObject{
    
    @Published var conversionData : [Currency] = []
    @Published var baseSTR: String = ""
    
    init(){
        fetch()
    }
    
    
    func fetch(){
        let APIKey = "APIKEY"
        let url = "http://api.exchangeratesapi.io/v1/latest?access_key=\(APIKey)&format=1"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, _ )in
            
            guard let JSONdata = data else{return}
            
            do{
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONdata)
                self.baseSTR = conversion.base
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap({ (key,value) -> Currency? in
                        
                        return Currency(currencyName: key, currencyValue: value)
                    })
                }
                
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        .resume()
        
    }
   
    
    
    
    
    
}
