//
//  FlightInfo.swift
//  FlightScanner
//
//  Created by Ian Donker on 17/11/2021.
//

import SwiftUI

struct FlightInfo: View, Equatable {
    var flightNumber: String
    var arrivalAirport: String
    var arrivalIataCode: String
    var departureIataCode: String
    var departureAirport: String
    var flightTime: String
    var departureTime: String
    var arrivalTime: String
    var actualDepartureTime: String
    var actualArrivalTime: String
    var airline: String
    var aircraftType: String
    var registration: String
    var age: String
    
    var body: some View {
        VStack {
            
            Section(header: Text("Flight information").font(.title)) {
                HStack {
                    ScheduledActualView(iataCode: departureIataCode, departureAirport: departureAirport, scheduledTime: departureTime, actualTime: actualDepartureTime)

                    ScheduledActualView(iataCode: arrivalIataCode, departureAirport: arrivalAirport, scheduledTime: arrivalTime, actualTime: actualArrivalTime)

                }
            }
            .padding()

            Section(header: Text("Aircraft information").font(.title)) {
                
                    VStack {
                    Text("Type")
                            .foregroundColor(.secondary)
                    Text(aircraftType)
                    }
                    
                    VStack {
                        HStack {
                            Text("Registration")
                                .foregroundColor(.secondary)
                            Text("Age")
                                .foregroundColor(.secondary)
                        }
                    HStack {
                    Text(registration)
                    Text(age)
                    }
                    }
                
                
            } // aircraft information closing curly bracket
           
            ZStack {
            
        CloudPaths(flag: false)
                
        PathView(flag: false, flightTime: "2.15", arrivalAirport: "Barcelona", departureAirport: "Amsterdam")
         
            }
        }
        .navigationBarTitle(flightNumber, displayMode: .inline)
    }
}



struct FlightInfo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlightInfo(flightNumber: "HV2022", arrivalAirport: "Barcelona", arrivalIataCode: "BCN", departureIataCode: "AMS", departureAirport: "Amsterdam", flightTime: "2.05", departureTime: "06:00", arrivalTime: "08:20", actualDepartureTime: "06:05", actualArrivalTime: "08:10", airline: "Transavia", aircraftType: "Boeing 737-800", registration: "PH-HXK", age: "2")
        }
    }
}

struct ScheduledActualView: View {
    let iataCode: String
    let departureAirport: String
    let scheduledTime: String
    let actualTime: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle())
            VStack {
                Text(iataCode)
                    .frame(width: 75, height: 55)
                    .font(.largeTitle)
                Text(departureAirport)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Scheduled")
                        Text(scheduledTime)
                            .font(.title2)
                    }
                    HStack {
                        Text("Estimated:")
                        Text("\(actualTime)")
                            .foregroundColor(actualTime < scheduledTime || actualTime == scheduledTime ? .green : .red)
                            .font(.title2)
                    }
                }
            }
        }
       
    }
}
