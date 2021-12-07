//
//  PopUpView.swift
//  FlightScanner
//
//  Created by Lars Neeft on 06/12/2021.
//

import SwiftUI

struct PopUpMenu: View {
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            ForEach(MenuViewModel.allCases, id: \.self) { item in
                MenuItem(viewModel: item)
            }
            Spacer()
        }
        .transition(.scale)
    }
}

struct MenuItem: View {
    let viewModel: MenuViewModel
    let dimension: CGFloat = 48
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: dimension, height: dimension)
                    .shadow(radius: 4)
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(12)
                    .frame(width: dimension, height: dimension)
                    .foregroundColor(Color(.white))
                
            }
            
            NavigationLink(destination: viewModel.view) {
                Text(viewModel.title)
                    .foregroundColor(.white)
                    .font(.footnote)
            }
        }
        
    }
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
    
    
}



struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
