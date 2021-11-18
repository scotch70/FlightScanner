//
//  MapView.swift
//  FlightScanner
//
//  Created by Ian Donker on 15/11/2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

  let region: MKCoordinateRegion
    
    @Binding var requestLocation: CLLocationCoordinate2D
    @Binding var destinationLocation: CLLocationCoordinate2D
    
  let lineCoordinates: [CLLocationCoordinate2D]
  

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    mapView.region = region
    mapView.showsCompass = true
    mapView.isRotateEnabled = false
      
    let compass = MKCompassButton(mapView: mapView)
    compass.frame.origin = CGPoint(x: 20, y: 20)
    compass.compassVisibility = .visible
    mapView.addSubview(compass)

    let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = requestLocation
    annotation.title = NSLocalizedString("Plane", comment: "Plane marker")
    
    mapView.addAnnotation(annotation)
    mapView.addOverlay(polyline)

    return mapView
  }

  func updateUIView(_ view: MKMapView, context: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

}

class Coordinator: NSObject, MKMapViewDelegate {
  var parent: MapView

  init(_ parent: MapView) {
    self.parent = parent
  }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let routePolyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: routePolyline)
      renderer.strokeColor = UIColor.systemBlue
      renderer.lineWidth = 5
      return renderer
    }
    return MKOverlayRenderer()
  }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let planeIdentifier = "Plane"
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: planeIdentifier)
                ?? MKAnnotationView(annotation: annotation, reuseIdentifier: planeIdentifier)
        
       
        
        annotationView.image = UIImage(systemName: "airplane")
        annotationView.transform = mapView.transform.rotated(by: CGFloat(degreesToRadians(degrees: 0)))
        
       
        return annotationView
    }
    private func directionBetweenPoints(sourcePoint: MKMapPoint, _ destinationPoint: MKMapPoint) -> CLLocationDirection {
        let x = destinationPoint.x - sourcePoint.x
        let y = destinationPoint.y - sourcePoint.y
        
        return radiansToDegrees(radians: (atan2(y, x)).truncatingRemainder(dividingBy: 450))
    }
    private func radiansToDegrees(radians: Double) -> Double {
        return radians * 180 / .pi
    }

    private func degreesToRadians(degrees: Double) -> Double {
        return degrees * .pi / 180
    }
}
