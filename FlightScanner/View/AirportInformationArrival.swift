//
//  AirportInformationArrival.swift
//  FlightScanner
//
//  Created by Ian Donker on 07/12/2021.
//

import SwiftUI

struct AirportInformationArrival: View {
    @State private var showsFact = false
    @State private var showsQuestion = false
    @State private var showsAirportInfo = true
    let question = """
Do you know why runways are named
after numbers and sometimes even
have R, L or C in their name?
"""
    let answer = """
If you add a 0 to the runway
for example: 04 makes 040
Then you have the direction you're flying to.

In case when multiple runways are alligned parallel
Then you add the R, L or C
R = Right
L = Left
C = Center
"""
    
    var body: some View {
        NavigationView {
        if showsAirportInfo == true {
            VStack {
                ArrivalAirportScreen(city: "Barcelona", airportName: "El Prat", iataCode: "BCN", country: "Spain", numberOfRunways: 3)
                Divider()
                
                HStack {
                    
                    Text("Fun fact")
                        .foregroundColor(.blue)
                    
                    Image(systemName: "questionmark")
                    
                }
                .onTapGesture {
                    showsAirportInfo = false
                    showsQuestion = true
                }
                
                AirportDetailView(airportName: "El Prat", countryName: "Spain", lat: "41.297445", long: "2.083294")
            }
            .navigationBarTitle("Airport information", displayMode: .inline)
        } else if showsQuestion == true {
            ZStack {
                Image(systemName: "questionmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                    .opacity(1)
                
                VStack {
                    Text(question)
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    
                    Text("Answer")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showsQuestion = false
                            showsFact = true
                        }
                    
                }
            }
        } else if showsFact == true {
            VStack {
                Text(answer)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Text("Return to airport information")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        showsFact = false
                        showsAirportInfo = true
                    }
            }
           
        }
        }
    }
}


struct AirportInformationArrival_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AirportInformationArrival()
            .navigationBarTitle("Airport information", displayMode: .inline)
        }
    }
}



