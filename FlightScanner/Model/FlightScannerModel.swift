//
//  FlightScannerModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 07/10/2021.
//

import Foundation
import Combine

// MARK: - FlightData
struct FlightData: Identifiable, Codable  {
    var id = UUID()
    let pagination: Pagination
    var data: [Datum]
    
    enum CodingKeys: CodingKey {
        case pagination, data
    }
    
}

// MARK: - Datum
struct Datum: Identifiable, Codable  {
    var id = UUID()
    let flightData: String
    let flightStatus: String
    let departure, arrival: Departure
    let airline: Airline
    let flight: Flight
    let aircraft: Aircraft?
    
    enum CodingKeys: String, CodingKey {
        case flightData = "flight_date"
        case flightStatus = "flight_status"
        case departure, arrival, airline, aircraft, flight
    }
}


// MARK: - Departure
struct Departure: Codable {
    let airport: String?
    let timezone: String?
    let iata, icao: String?
    let terminal, gate: String?
    let baggage: String?
    let delay: Int?
    let scheduled, estimated: String
}

// MARK: - Airline
struct Airline: Codable {
    let name: String
    let iata, icao: String?
}

// MARK: - Aircraft
struct Aircraft: Codable {
    let registration, iata, icao, icao24: String
}

struct Flight: Codable {
    let number: String?
    let iata, icao: String?
    
}



// MARK: - Pagination
struct Pagination: Codable {
    let limit, offset, count, total: Int
}
