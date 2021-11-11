//
//  AircraftLocation.swift
//  FlightScanner
//
//  Created by Ian Donker on 05/11/2021.
//

import SwiftUI
import MapKit

struct AircraftPosition: Identifiable {
    var id = UUID()
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}

struct AircraftLocation: View {
    @StateObject private var aircraftViewModel = AircraftLocationViewModel()
    
    let aircraftPosition: AircraftPosition
    
    
    var body: some View {
        Map(coordinateRegion: $aircraftViewModel.region, showsUserLocation: true, annotationItems: [aircraftPosition]) { place in
            MapAnnotation(coordinate: MapDetails.startingLocation) {
                Image(systemName: "airplane")
                    .modifier(AirplaneModifier())
            }
        }
            .ignoresSafeArea()
            .onAppear {
                aircraftViewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct AircraftLocation_Previews: PreviewProvider {
    static var previews: some View {
        AircraftLocation(aircraftPosition: AircraftPosition(lat: 52.008668, long: 4.978975))
    }
}
