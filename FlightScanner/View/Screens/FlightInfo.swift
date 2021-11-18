//
//  FlightInfo.swift
//  FlightScanner
//
//  Created by Ian Donker on 17/11/2021.
//

import SwiftUI

struct FlightInfo: View {
    var arrivalAirport: String
    var departureAirport: String
    var flightTime: String
    
    var airline: String
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text(airline)
                }
                .frame(width: 300, height: 500)
                .background(Color.secondary)
                
            }
          
        PathView(flag: false, flightTime: flightTime, arrivalAirport: arrivalAirport, departureAirport: departureAirport)
        
        }
    }
}

struct FlightInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightInfo(arrivalAirport: "Barcelona", departureAirport: "Amsterdam", flightTime: "2.05", airline: "Transavia")
        }
    }
}
