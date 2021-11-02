//
//  FlightsDetailView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 31/10/2021.
//

import SwiftUI
import MapKit

struct FlightsDetailView: View {
    var flightNumber: String
    var airlineName: String
    var departure: String
    var departureIataCode: String
    var arrival: String
    var arrivalIataCode: String
    var arrivalTime: String
    var depatureTime: String
        
        var body: some View {
            VStack {
                Text(flightNumber)
                Text(airlineName)
                
                HStack {
                    VStack{
                        Text(departure)
                        Text(departureIataCode)
                        Text(depatureTime)
                    }
                    
                    VStack {
                        Text(arrival)
                        Text(arrivalIataCode)
                        Text(arrivalTime)
                    }
                }
            }
            .navigationTitle(flightNumber + "  " + airlineName)
        }
    
}



struct FlightsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        FlightsDetailView(flightNumber: "HV2022", airlineName: "Transavia", departure: "Amsterdam", departureIataCode: "AMS", arrival: "London Heathrow", arrivalIataCode: "LHR", arrivalTime: "08:00", depatureTime: "08:15")
        }
    }
}
