//
//  TrackerMapView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 22/10/2021.
//

import SwiftUI
import MapKit

struct TrackerMapView: View {
        @Binding private var lat: Double
        @Binding private var lon: Double

        private let initialLatitudinalMetres: Double = 1000
        private let initialLongitudinalMetres: Double = 1000

        @State private var span: MKCoordinateSpan?

        init(lat: Binding<Double>, lon: Binding<Double>) {
            _lat = lat
            _lon = lon
        }
        
        private var region: Binding<MKCoordinateRegion> {
            Binding {
                let centre = CLLocationCoordinate2D(latitude: lat, longitude: lon)

                if let span = span {
                    return MKCoordinateRegion(center: centre, span: span)
                } else {
                    return MKCoordinateRegion(center: centre, latitudinalMeters: initialLatitudinalMetres, longitudinalMeters: initialLongitudinalMetres)
                }
            } set: { region in
                lat = region.center.latitude
                lon = region.center.longitude
                span = region.span
            }
        }
    
        var body: some View {
            Map(coordinateRegion: region)
                .edgesIgnoringSafeArea(.all)
        }
    
    
}

struct TrackerMapView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerMapView(lat: .constant(51.9436445),lon: .constant(4.4704739))
    }
}
