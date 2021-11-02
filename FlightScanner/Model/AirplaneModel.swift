//
//  AirplaneModel.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 23/10/2021.
//

import Foundation

// MARK: - Airports
struct AirplaneModel: Codable {
    let pagination: AirplanePagination
    let data: [AirplaneData]
}

// MARK: - Datum
struct AirplaneData: Codable {
    let id, iataType, airplaneID, airlineIataCode: String
    let iataCodeLong, iataCodeShort: String
    let airlineIcaoCode: String?
    let constructionNumber, deliveryDate, enginesCount, enginesType: String
    let firstFlightDate, icaoCodeHex, lineNumber, modelCode: String
    let registrationNumber: String
    let testRegistrationNumber: String?
    let planeAge: String
    let planeClass: String?
    let modelName, planeOwner, planeSeries, planeStatus: String
    let productionLine, registrationDate: String
    let rolloutDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case iataType = "iata_type"
        case airplaneID = "airplane_id"
        case airlineIataCode = "airline_iata_code"
        case iataCodeLong = "iata_code_long"
        case iataCodeShort = "iata_code_short"
        case airlineIcaoCode = "airline_icao_code"
        case constructionNumber = "construction_number"
        case deliveryDate = "delivery_date"
        case enginesCount = "engines_count"
        case enginesType = "engines_type"
        case firstFlightDate = "first_flight_date"
        case icaoCodeHex = "icao_code_hex"
        case lineNumber = "line_number"
        case modelCode = "model_code"
        case registrationNumber = "registration_number"
        case testRegistrationNumber = "test_registration_number"
        case planeAge = "plane_age"
        case planeClass = "plane_class"
        case modelName = "model_name"
        case planeOwner = "plane_owner"
        case planeSeries = "plane_series"
        case planeStatus = "plane_status"
        case productionLine = "production_line"
        case registrationDate = "registration_date"
        case rolloutDate = "rollout_date"
    }
}

// MARK: - Pagination
struct AirplanePagination: Codable {
    let offset, limit, count, total: Int
}
