//
//  CitiesModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import Foundation

// MARK: - Cities
struct CitiesModel: Codable {
    let pagination: CityPagination
    let data: [CityData]
}

// MARK: - Datum
struct CityData: Codable {
    let id, gmt, cityID, iataCode: String
    let countryIso2: String
    let geonameID: String?
    let latitude, longitude: Double
    let cityName, timezone: String

    enum CodingKeys: String, CodingKey {
        case id, gmt
        case cityID = "city_id"
        case iataCode = "iata_code"
        case countryIso2 = "country_iso2"
        case geonameID = "geoname_id"
        case latitude, longitude
        case cityName = "city_name"
        case timezone
    }
}

// MARK: - Pagination
struct CityPagination: Codable {
    let offset, limit, count, total: Int
}
