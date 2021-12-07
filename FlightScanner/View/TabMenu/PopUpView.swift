//
//  PopUpView.swift
//  FlightScanner
//
//  Created by Lars Neeft on 06/12/2021.
//

import SwiftUI

class PopUpMenuRouter: ObservableObject {
    @Published var currentItem: MenuViewModel = .departure
    
     var view: some View { return currentItem.view }
}

enum MenuViewModel: Int, CaseIterable {
    case departure
    case time
    case arrival
    case share
    
    var imageName: String {
        switch self {
        case .departure: return "airplane.departure"
        case .time: return "airplane.circle"
        case .arrival: return "airplane.arrival"
        case .share: return "square.and.arrow.up"
        }
    }
    
    var view: some View {
        switch self {
        case .departure:
            return AnyView(AirportInformationDeparture())
        case .time:
            return AnyView(Text("Time"))
        case .arrival:
            return AnyView(AirportInformationArrival())
        case .share:
            return AnyView(Text("Share"))
        }
    }
    
    var title: String {
        switch self {
        case .departure:
            return "Depature"
        case .time:
            return "Time"
        case .arrival:
            return "Arrival"
        case .share:
            return "Share"
            
            
        }
    }
    
    
    
}




