//
//  CountryListView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel = FlightScannerViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Data")) {
                ForEach(viewModel.allData, id: \.self) { item in
                    Text(item.capitalized)
                }
                
            }
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
