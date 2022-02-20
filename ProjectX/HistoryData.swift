//
//  HistoryData.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import Foundation


class HistoryData: ObservableObject{
    
    @Published var historyConversionData : [Currency] = []
    @Published var date: String = ""
    @Published var symbol: String = ""
    
        
    func HistoryFetch(){
        let APIKey = "APIKEY"
        let url = "http://api.exchangeratesapi.io/v1/\(date)?access_key=\(APIKey)&symbols=\(symbol)&format=1"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, _ )in
            
            guard let JSONdata = data else{return}
            
            do{
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONdata)
                
                DispatchQueue.main.async {
                    self.historyConversionData = conversion.rates.compactMap({ (key,value) -> Currency? in
                        
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
   
    func calculateDate(){
        
        let currentDateTime = Date()
        
        guard let previousWeek = Calendar.current.date(byAdding: .day, value: -7, to: currentDateTime) else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        let today = dateFormatter.string(from: previousWeek)
        date = today
        
    }
    
    
    
    
}
