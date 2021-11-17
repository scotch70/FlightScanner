//
//  AirportView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

struct AirportView: View {
    @StateObject var airportViewModel = AirportViewModel()
    
    var body: some View {
            List {
                Section(header: Text("Airports")) {
                    ForEach(airportViewModel.airports) { item in
                        ForEach(item.data) { ita in
                            NavigationLink(destination: AirportDetailView(airportName: ita.airportName, countryName: ita.countryName ?? "", lat: ita.latitude, long: ita.longitude)) {
                                Text(ita.airportName)
                            }
                        }
                    }
                    
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Airports")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView()
    }
}
