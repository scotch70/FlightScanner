//
//  AirlineView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

struct AirlineView: View {
    @StateObject var airlineViewModel = AirlineViewModel()
    
    var body: some View {
        
        List {
            Section(header: Text("Airline")) {
                ForEach(airlineViewModel.airlines) { item in
                    ForEach(item.data) { ita in
                        Text(ita.airlineName)
                    }
                }
            }
            
            
            .listStyle(GroupedListStyle())
            
            .navigationBarTitle("Airline")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct AirlineView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineView()
    }
}
