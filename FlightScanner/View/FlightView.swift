//
//  FlightView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 07/10/2021.
//

import SwiftUI


struct FlightView: View {
    @StateObject var viewModel = FlightScannerViewModel()
    @State private var searchText = ""
    @State private var searching = false
    @State private var test = true
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText, searching: $searching)
                List {
                    Section(header: Text("Flights")) {
                        ForEach(viewModel.flights) { item in
                            ForEach(item.data.filter ({ "\($0)".contains(searchText) || searchText.isEmpty })) { ita in
                                TableCellViewCell(image: "paperplane", depature: ita.departure.icao ?? "", flightNumber: ita.flight.icao ?? "")
                            }
                    }
                    .listStyle(GroupedListStyle())
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarTitle("Flight Scanner")
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar {
                    if searching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation {
                                searching = false
                            }
                        }
                    }
                }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        FlightView()
        
    }
}
