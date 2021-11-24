//
//  AirportInformation.swift
//  FlightScanner
//
//  Created by Ian Donker on 24/11/2021.
//

import SwiftUI

struct AirportInformation: View {
    var body: some View {
        VStack {
          DepartureAirportScreen()
            Divider()
          ArrivalAirportScreen()
        }
        .navigationBarTitle("Airport information", displayMode: .inline)
    }
}

struct AirportInformation_Previews: PreviewProvider {
    static var previews: some View {
        AirportInformation()
    }
}
