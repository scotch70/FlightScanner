//
//  MainView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
        TabView {
            AirportToAirportView(flightTime: 2.05, aircraftPosition: AircraftPosition(lat: 52.308056, long: 4.764167))
                .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            AirlineView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AirportView()
                .tabItem {
                    Label("Airport", systemImage: "mappin.and.ellipse")
                }
            
            UserSettingsView()
                .tabItem {
                    Label("Settings", systemImage: "person.fill")
                }
                
                .clipShape(Capsule())
                
        }
        .opacity(0.7)
        .navigationViewStyle(StackNavigationViewStyle())
        
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
