//
//  AirportDetailView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI
import MapKit

struct AirportDetailView: View {
    var airportName: String
    var countryName: String
    var lat: String
    var long: String
    
    var latitude: Double {
        let latitude = Double(lat)
      
            return latitude ?? 0.0
    }
    
    var longitude: Double {
        let longitude = Double(long)
        return longitude ?? 0.0
    }
    
    var body: some View {
        VStack {
            Text(countryName)
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), interactionModes: [])
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .navigationBarTitle(airportName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
}

struct AirportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirportDetailView(airportName: "Amsterdam", countryName: "The Netherlands", lat: "", long: "")
    }
}
