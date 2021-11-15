//
//  AirplaneModifier.swift
//  FlightScanner
//
//  Created by Ian Donker on 11/11/2021.
//

import SwiftUI
import MapKit

struct AirplaneModifier: ViewModifier {
    @State private var lineCoordinates = [
        MapDetails.startingLocation,
        MapDetails.endLocation
    ]
    @State private var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan
    )
    
    func body(content: Content) -> some View {
        Image(systemName: "airplane")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.red)
            .rotationEffect(.degrees(rotateAirplaneTo(direction: .east)))
    }
    
    enum AirplaneEffect {
        case north, northEast, east, southEast, south, southWest, west, northWest
    }
    
    private func rotateAirplaneTo(direction: AirplaneEffect) -> Double {
        let degree: Double
        
        switch direction {
        case .north:
            degree = 360
        case .northEast:
            degree = 45
        case .east:
            degree = 90
        case .southEast:
            degree = 135
        case .south:
            degree = 180
        case .southWest:
            degree = 225
        case .west:
            degree = 270
        case .northWest:
            degree = 315
        }
        return degree
    }
}

