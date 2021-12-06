//
//  ViewRouter.swift
//  FlightScanner
//
//  Created by Lars Neeft on 06/12/2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentItem: TabBarViewModel = .home
    
     var view: some View { return currentItem.view }
}

enum TabBarViewModel: Int, CaseIterable {
    case home
    case search
    case notifications
    case account
    
    var imageName: String {
        switch self {
        case .home: return "house.fill"
        case .search: return "magnifyingglass"
        case .notifications: return "bell.fill"
        case .account: return "person.fill"
        }
    }
    
    var view: some View {
        switch self {
        case .home:
            return AnyView(AirportToAirportView(flightTime: 2.05, aircraftPosition: AircraftPosition(lat: 4.764167, long: 4.764167)))
        case .search:
            return AnyView(UserSettingsView())
        case .notifications:
            return AnyView(UserSettingsView())
        case .account:
            return AnyView(UserSettingsView())
        }
    }
}
