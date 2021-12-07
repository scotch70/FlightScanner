//
//  AirlineInformation.swift
//  FlightScanner
//
//  Created by Ian Donker on 07/12/2021.
//

import SwiftUI

struct AirlineInformation: View {
    let airlineName: String
    let founded: String
    let iataCode: String
    let callsign: String
    let fleet: String
    let fleetAge: String
    let hubCode: String
    let country: String
    let countryPrefix: String
    
    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle())
        VStack {
                Text(airlineName)
                    .font(.title)
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text("Founded:")
                    Text("Iata code:")
                    Text("Callsign:")
                    Text("Fleetsize:")
                    Text("Average fleet age:")
                    Text("Hub Code:")
                    Text("Country:")
                }
                .font(.title2)
                .padding()
               
                VStack(alignment: .trailing) {
                    Text(founded)
                    Text(iataCode)
                    Text(callsign)
                    Text(fleet)
                    Text("\(fleetAge) years")
                    Text(hubCode)
                    Text(country)
                    Text(countryPrefix)
                    
                }
                .font(.title2)
                .padding()
            }
           
            }
            .foregroundColor(.white)
            .background(Color.secondary)
            .opacity(1)
            .cornerRadius(12)
//        }
    }
    }


struct AirlineInformation_Previews: PreviewProvider {
    static var previews: some View {
        AirlineInformation(airlineName: "Transavia", founded: "1965", iataCode: "HV", callsign: "TRA", fleet: "39", fleetAge: "12", hubCode: "AMS", country: "The Netherlands", countryPrefix: "NL")
    }
}
