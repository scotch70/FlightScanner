//
//  AircraftLocation.swift
//  FlightScanner
//
//  Created by Ian Donker on 05/11/2021.
//

import SwiftUI
import MapKit

struct AircraftLocation: View {
    @StateObject private var aircraftViewModel = AircraftLocationViewModel()
    
    
    
    var body: some View {
        Map(coordinateRegion: $aircraftViewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemRed))
            .onAppear {
                aircraftViewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct AircraftLocation_Previews: PreviewProvider {
    static var previews: some View {
        AircraftLocation()
    }
}
