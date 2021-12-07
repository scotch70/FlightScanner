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
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
        
}

enum MenuViewModel: Int, CaseIterable {
    case departue
    case time
    case arrival
    case share
    
    var imageName: String {
        switch self {
        case .departue: return "airplane.departure"
        case .time: return "airplane.circle"
        case .arrival: return "airplane.arrival"
        case .share: return "square.and.arrow.up"
        }
    }
    
    var title: String {
        switch self {
        case .departue:
            return "Departure"
        case .time:
            return "Time"
        case .arrival:
            return "Arrival"
        case .share:
            return "Share"
        }
    }
}



struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
