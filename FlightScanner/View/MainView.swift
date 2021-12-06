//
//  MainView.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 26/10/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabBarView()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
