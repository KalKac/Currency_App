//
//  Currency.swift
//  ProjectX
//
//  Created by Kacper Kalicki on 19/02/2022.
//

import Foundation





struct Conversion : Codable{
 
    var base: String
    var date: String
    var rates: [String: Double]
    
}


struct Currency: Identifiable, Hashable {
    var id = UUID()
    var currencyName: String
    var currencyValue: Double
    
}
