//
//  ArrivalAirportScreen.swift
//  FlightScanner
//
//  Created by Ian Donker on 24/11/2021.
//

import SwiftUI

struct ArrivalAirportScreen: View {
    var city: String
    var airportName: String
    var iataCode: String
    var country: String
    var numberOfRunways: Int

    
    var runway = [
        Runways(runway: "02/20", length: "2528m"),
        Runways(runway: "07L/25R", length: "3743m"),
        Runways(runway: "07R/25L", length: "2660m")
    ]
 
    var body: some View {
        VStack {
        ZStack {
            VStack {
                Text("Inbound airport information")
                    .padding(.horizontal)
                    .font(.title2)
                    .foregroundColor(.white)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(iataCode)
                        Text(airportName)
                        Text(city)
                        Text(country)
                    }
                    .padding()
                    .frame(width: 170, height: 100)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    .padding(5)
                    
                    Image(systemName: "airplane.arrival")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                }
                    
                    VStack {
                        if numberOfRunways < 1 || numberOfRunways == 1 {
                            Text("\(numberOfRunways) runway")
                                .font(.title2)
                                .foregroundColor(.white)
                        } else {
                            Text("\(numberOfRunways) runways")
                                .font(.title2)
                                .foregroundColor(.white)
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
                                    .background(Color.white)
                                    .cornerRadius(12)
                                }
                        
                            }
                        }
                    }
                    .padding()
                    .frame(width: 320, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                
            }
        }
        .frame(width: 340, height: 300)
        .background(Color.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 25))
            
        }
    }
}

struct ArrivalAirportScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalAirportScreen(city: "Barcelona", airportName: "El Prat", iataCode: "BCN", country: "Spain", numberOfRunways: 3)
    }
}
