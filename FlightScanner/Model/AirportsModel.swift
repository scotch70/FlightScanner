//
//  AirportsModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import Foundation

// MARK: - Airports
struct AirportsModel: Identifiable, Codable {
    var id = UUID()
    let pagination: AirportPagination
    let data: [AirportData]
    
    enum CodingKeys: CodingKey {
        case pagination, data
    }
}

struct Runways: Identifiable {
    var id = UUID()
    var runway: String
    var length: String
}
//struct AirportDeparture {
//    var runways: [Runways]
//    var airport = AirportViewModel()
//    var city: String
//    var airportName: String
//    var iataCode: String
//    var country: String
//    var numberOfRunways: Int
//}
//zijn deze overbodig??????
//struct AirportArrival {
//    var runways: [Runways]
//    var airport = AirportViewModel()
//    var city: String
//    var airportName: String
//    var iataCode: String
//    var country: String
//    var numberOfRunways: Int
//}

// MARK: - Datum
struct AirportData: Identifiable, Codable {
    let id: String
    let gmt: String?
    let airportID, iataCode: String
    let cityIataCode, icaoCode, countryIso2, geonameID: String
    let latitude, longitude, airportName: String
    let countryName: String?
    let phoneNumber: String?
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case id, gmt
        case airportID = "airport_id"
        case iataCode = "iata_code"
        case cityIataCode = "city_iata_code"
        case icaoCode = "icao_code"
        case countryIso2 = "country_iso2"
        case geonameID = "geoname_id"
        case latitude, longitude
        case airportName = "airport_name"
        case countryName = "country_name"
        case phoneNumber = "phone_number"
        case timezone
    }
}

// MARK: - Pagination
struct AirportPagination: Codable {
    let offset, limit, count, total: Int
}
