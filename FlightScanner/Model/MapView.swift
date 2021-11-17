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
}
