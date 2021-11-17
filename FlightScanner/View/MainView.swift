//
//  MainView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FlightView()
                .tabItem {
                Label("Flights", systemImage: "paperplane")
            }
            AirlineView()
                .tabItem {
                    Label("Airline", systemImage: "briefcase")
                }
            AirportView()
                .tabItem {
                    Label("Airport", systemImage: "mappin.and.ellipse")
                }
            
            UserSettingsView()
                .tabItem {
                    Label("Counrty", systemImage: "map")
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
