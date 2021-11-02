//
//  AirlinesModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import Foundation

// MARK: - Airports
struct AirlinesModel: Identifiable, Codable {
    var id = UUID()
    let pagination: AirlinesPagination
    let data: [AirlinesData]
    
    enum CodingKeys: CodingKey {
        case pagination, data
    }
}

// MARK: - Datum
struct AirlinesData: Identifiable, Codable {
    let id, fleetAverageAge, airlineID, callsign: String
    let hubCode: String?
    let iataCode, icaoCode, countryIso2: String
    let dateFounded: String?
    let iataPrefixAccounting: String?
    let airlineName, countryName: String
    let fleetSize, status: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fleetAverageAge = "fleet_average_age"
        case airlineID = "airline_id"
        case callsign
        case hubCode = "hub_code"
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
        case countryIso2 = "country_iso2"
        case dateFounded = "date_founded"
        case iataPrefixAccounting = "iata_prefix_accounting"
        case airlineName = "airline_name"
        case countryName = "country_name"
        case fleetSize = "fleet_size"
        case status, type
    }
}

// MARK: - Pagination
struct AirlinesPagination: Codable {
    let offset, limit, count, total: Int
}
