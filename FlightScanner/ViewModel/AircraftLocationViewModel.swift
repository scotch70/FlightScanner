//
//  AircraftLocationViewModel.swift
//  FlightScanner
//
//  Created by Ian Donker on 05/11/2021.
//

import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 52.308056, longitude: 4.764167) // schiphol
    static let endLocation = CLLocationCoordinate2D(latitude: 41.2974, longitude:  2.0833) // BCN El Prat
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
}

final class AircraftLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert letting them know it's off.")
        }
    }
    
    private func checkLocationAuthorisation() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied permission. Go to your app settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorisation()
    }
}
