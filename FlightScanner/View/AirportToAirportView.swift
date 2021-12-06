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
    
    @State var requestLocation = CLLocationCoordinate2D(latitude: 52.308056, longitude:  4.764167)
    @State var destinationLocation = CLLocationCoordinate2D(latitude: 41.2974, longitude: 2.0833)
    
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
            
                MapView(region: region, requestLocation: $requestLocation, destinationLocation: $destinationLocation, lineCoordinates: lineCoordinates)
                
                
               
                
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
                                        
                                        NavigationLink(destination: FlightInfo(flightNumber: "HV2022", arrivalAirport: "Barcelona", arrivalIataCode: "BCN", departureIataCode: "AMS", departureAirport: "Amsterdam", flightTime: "2.05", departureTime: "06:00", arrivalTime: "08:20", actualDepartureTime: "06:05", actualArrivalTime: "08:10", airline: "Transavia", aircraftType: "Boeing 737-800", registration: "PH-HXK", age: "2")) {
                                            Text("Flight info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)

                                                
                                        }
                                        
                                        NavigationLink(destination: AirlineView()) {
                                            Text("Airline info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)

                                                
                                        }
                                        
                                        NavigationLink(destination: AirportInformation()){
                                            Text("Airport info")
                                                .padding()
                                                .background(Color.secondary)
                                                .foregroundColor(.white)
                                                .cornerRadius(25)
                                                .padding(.horizontal)
                                                
                                        }
                                        Button(action: actionSheet) {
                                            HStack {
                                                Text("Share")
                                                Image(systemName: "square.and.arrow.up")
                                            }
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
    .navigationViewStyle(StackNavigationViewStyle())
  }
    func actionSheet() {
            guard let urlShare = URL(string: "https://appstimize.nl") else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct AirportToAirportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AirportToAirportView(flightTime: 2.05, aircraftPosition: AircraftPosition(lat: 52.308056, long: 4.764167))
        }
            
    }
}
