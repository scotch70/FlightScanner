//
//  UserSettingsView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import SwiftUI

struct UserSettingsView: View {
    let data = ["User" : "person.fill", "Info": "info.circle", "History flights" : "book", "Privacy Policy" : "magnifyingglass", "Partners" : "person.2.fill"]
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("User Info")) {
                    ForEach(data.sorted(by: <), id: \.key) { key, value in
                        HStack(spacing : 10) {
                            Image(systemName: value)
                                .font(.subheadline)
                            Text(key)
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            PathView(flag: false, flightTime: "2:05", arrivalAirport: "Amsterdam", departureAirport: "Barcelona")
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}