//
//  DepartureAirportScreen.swift
//  FlightScanner
//
//  Created by Ian Donker on 24/11/2021.
//

import SwiftUI

struct DepartureAirportScreen: View {
    var airport = AirportDeparture(runways: [Runways(runway: "04/22", length: "2410")], city: "Amsterdam", airportName: "Schiphol", iataCode: "AMS", country: "The Netherlands", numberOfRunways: 6)
    
    var runway = [
        Runways(runway: "04/22", length: "2014m"),
        Runways(runway: "06/24", length: "3500m"),
        Runways(runway: "09/27", length: "3450m"),
        Runways(runway: "18R/36L", length: "3800m"),
        Runways(runway: "18C/36C", length: "3300m"),
        Runways(runway: "18L/36R", length: "3400")
    ]
 
    var body: some View {
        ZStack {
            VStack {
                Text("Outbound airport information")
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(airport.iataCode)
                        Text(airport.airportName)
                        Text(airport.city)
                        Text(airport.country)
                    }
                    .padding()
                    .frame(width: 170, height: 100)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    .padding(5)
                    
                    Image(systemName: "airplane.departure")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                    
                    VStack {
                        if airport.numberOfRunways < 1 || airport.numberOfRunways == 1 {
                            Text("\(airport.numberOfRunways) runway")
                                .foregroundColor(.blue)
                        } else {
                            Text("\(airport.numberOfRunways) runways")
                                .foregroundColor(.blue)
                        }
                        ScrollView(.horizontal) {
                            HStack(alignment: .center, spacing: 20) {
                                ForEach(runway) { rw in
                                    VStack {
                                        Text("Runway:")
                                        Text("\(rw.runway)")
                                        Text("\(rw.length)")
                                    }
                                    .padding()
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 75)
                                    .background(Color.secondary)
                                    .cornerRadius(12)
                                }
                        
                            }
                        }
                    }
                    .padding()
                    .frame(width: 320, height: 120)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                
            }
        }
        .frame(width: 340, height: 300)
        .background(Color.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
struct DepartureAirportScreen_Previews: PreviewProvider {
    static var previews: some View {
        DepartureAirportScreen()
    }
}
