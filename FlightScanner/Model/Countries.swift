//
//  Countries.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import Foundation

// MARK: - Countries
struct CountriesModel: Codable {
    let pagination: CountryPagination
    let data: [CountryData]
}

// MARK: - Datum
struct CountryData: Codable {
    let id, capital, currencyCode, fipsCode: String
    let countryIso2, countryIso3, continent, countryID: String
    let countryName, currencyName, countryISONumeric, phonePrefix: String
    let population: String

    enum CodingKeys: String, CodingKey {
        case id, capital
        case currencyCode = "currency_code"
        case fipsCode = "fips_code"
        case countryIso2 = "country_iso2"
        case countryIso3 = "country_iso3"
        case continent
        case countryID = "country_id"
        case countryName = "country_name"
        case currencyName = "currency_name"
        case countryISONumeric = "country_iso_numeric"
        case phonePrefix = "phone_prefix"
        case population
    }
}

// MARK: - Pagination
struct CountryPagination: Codable {
    let offset, limit, count, total: Int
}
