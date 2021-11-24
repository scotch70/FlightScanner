//
//  ArrivalAirportScreen.swift
//  FlightScanner
//
//  Created by Ian Donker on 24/11/2021.
//

import SwiftUI

struct ArrivalAirportScreen: View {
    var airport = AirportArrival(runways: [Runways(runway: "07L/25R", length: "3743")], city: "Barcelona", airportName: "El Prat", iataCode: "BCN", country: "Spain", numberOfRunways: 3)
    
    var runway = [
        Runways(runway: "02/20", length: "2528m"),
        Runways(runway: "07L/25R", length: "3743m"),
        Runways(runway: "07R/25L", length: "2660m")
    ]
 
    var body: some View {
        ZStack {
            VStack {
                Text("Inbound airport information")
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
                    
                    Image(systemName: "airplane.arrival")
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

struct ArrivalAirportScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalAirportScreen()
    }
}
