//
//  AirportToAirportView.swift
//  FlightScanner
//
//  Created by Ian Donker on 15/11/2021.
//

import SwiftUI
import MapKit

struct AirportToAirportView: View {
    @State private var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan
    )
    @StateObject private var aircraftViewModel = AircraftLocationViewModel()
    var flightTime: Double
    let aircraftPosition: AircraftPosition
    @State private var showingButtons = false
    
    @State private var lineCoordinates = [
        MapDetails.startingLocation,
        MapDetails.endLocation
    ]

    var body: some View {
        NavigationView {
            ZStack {
//                Map(coordinateRegion: $aircraftViewModel.region, showsUserLocation: true, annotationItems: [aircraftPosition]) { place in
//                    MapAnnotation(coordinate: MapDetails.startingLocation) {
//                                        Image(systemName: "airplane")
//                                            .modifier(AirplaneModifier())
//                    }
//                }
            

                MapView(region: region, lineCoordinates: lineCoordinates)
                Image(systemName: "airplane")
                    .modifier(AirplaneModifier())
                
                VStack {
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                    if showingButtons == false {
                                        Button {
                                            showingButtons = true
                                        } label: {
                                            Image(systemName: "info")
                                                .padding()
                                                .background(Color.green)
                                                .opacity(1)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)
                                                
                                        }
                                        
                                    } else {
                                        Button {
                                            showingButtons = false
                                        } label: {
                                            Image(systemName: "chevron.down.circle")
                                                .padding()
                                                .background(Color.red)
                                                .opacity(1)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)

                                                
                                        }
                                        
                                        Button {
                                            // Show flight information
                                        } label: {
                                            Text("Flight info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)

                                                
                                        }
                                        
                                        Button {
                                            // Show Airline information
                                        } label: {
                                            Text("Airline info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)

                                                
                                        }
                                        
                                        Button {
                                            // Show Airport information
                                        } label: {
                                            Text("Airport info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)
                                                
                                        }
                                       
                                    }
                                        HStack {
                                            Spacer()
                                    Text("Arriving in \(flightTime, specifier: "%.2f")h")
                                        .padding()
                                        .background(Color.secondary)
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        .padding(.horizontal)
                                    
                                }
                                    }
                                }.padding(.bottom)
            }
        .edgesIgnoringSafeArea(.all)
    }
  }
}

struct AirportToAirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportToAirportView(flightTime: 2.05, aircraftPosition: AircraftPosition(lat: 52.308056, long: 4.764167))
    }
}
