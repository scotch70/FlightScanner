//
//  AirportInformation.swift
//  FlightScanner
//
//  Created by Ian Donker on 24/11/2021.
//

import SwiftUI

struct AirportInformationDeparture: View {
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
        if showsAirportInfo == true {
            VStack {
                DepartureAirportScreen(city: "Amsterdam", airportName: "Schiphol", iataCode: "AMS", country: "The Netherlands", numberOfRunways: 6)
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
                
                AirportDetailView(airportName: "Schiphol", countryName: "The Netherlands", lat: "52.308056", long: "4.764167")
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
            .navigationBarTitle("Airport information", displayMode: .inline)
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
            .navigationBarTitle("Airport information", displayMode: .inline)
        }
    }
}

struct AirportInformation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AirportInformationDeparture()
            .navigationBarTitle("Airport information", displayMode: .inline)
        }
    }
}
